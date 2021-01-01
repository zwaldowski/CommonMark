import XCTest
import CommonMark

class CustomNodeTests: XCTestCase {
    class Admonition: CustomBlock {
        var title: String

        init(decoding blockQuote: BlockQuote, from decoder: Decoder?) throws {
            guard let paragraph = blockQuote.children.first as? Paragraph,
                  let title = paragraph.children.first as? Strong,
                  let textAfterTitle = (paragraph.children.dropFirst().first as? Text)?.literal else {
                let context = DecodingError.Context(codingPath: decoder?.codingPath ?? [], debugDescription: "Expected a block quote starting with bold text followed by a colon.")
                throw DecodingError.dataCorrupted(context)
            }

            self.title = String(title.render(format: .plain).reversed().drop(while: { $0 == ":" || $0.isWhitespace }).reversed())
            super.init()
            self.children.append(Paragraph(children: [
                Text(literal: String(textAfterTitle.drop(while: \.isWhitespace)))
            ] + paragraph.children.dropFirst(2)))
        }

        convenience init?(from blockQuote: BlockQuote) {
            try? self.init(decoding: blockQuote, from: nil)
        }

        required convenience init(from decoder: Decoder) throws {
            try self.init(decoding: BlockQuote(from: decoder), from: decoder)
        }

        override var markdownPrefix: String? {
            "> "
        }

        override func renderMarkdownStart<Output>(to target: inout Output) where Output : MarkdownOutputStream {
            target.write("> **")
            target.writeEscaped(title)
            target.write(":** ")
        }

        override func renderHTMLStart<Output>(to target: inout Output) where Output: MarkdownOutputStream {
            target.write("<aside><strong>")
            target.writeEscaped(title)
            target.write("</strong>")
        }

        override func renderHTMLEnd<Output>(to target: inout Output) where Output: MarkdownOutputStream {
            target.write("</aside>")
        }
    }

    func testCustomBlockRenderedToMarkdown() throws {
        let document = try Document(Fixtures.admonition)
        let blockQuote = try XCTUnwrap(document.children.dropFirst().first as? BlockQuote)
        let admonition = try XCTUnwrap(Admonition(from: blockQuote))
        document.children.replace(blockQuote, with: admonition)
        XCTAssertEqual("\(document)", Fixtures.admonition)
    }

    func testCustomBlockRenderedToHTML() throws {
        let document = try Document(Fixtures.admonition)
        let blockQuote = try XCTUnwrap(document.children.dropFirst().first as? BlockQuote)
        let admonition = try XCTUnwrap(Admonition(from: blockQuote))
        document.children.replace(blockQuote, with: admonition)
        XCTAssertEqual(document.render(format: .html), #"""
        <h1>Heading</h1>
        <aside><strong>Tip</strong>
        <p>This is a <code>tip</code> aside.
        This may present similarly to a block quote.</p>
        </aside>
        <p>This text comes after the admonition.</p>

        """#)
    }

    func testCustomBlockCodingRoundtrip() throws {
        let document = try Document(Fixtures.admonition)
        let blockQuote = try XCTUnwrap(document.children.dropFirst().first as? BlockQuote)
        let admonition = try XCTUnwrap(Admonition(from: blockQuote))

        let encoded = try JSONEncoder().encode(admonition)
        let decoded = try JSONDecoder().decode(Admonition.self, from: encoded)

        XCTAssertEqual("\(decoded)", "\(admonition)")
    }
}
