import XCTest
import CommonMark

final class DocumentParsingTests: XCTestCase {
    func testDocumentParsing() throws {
        let document = try Document(Fixtures.udhr)

        XCTAssertEqual(document.children.count, 3)

        let heading = try XCTUnwrap(document.children.first as? Heading)
        XCTAssertEqual(heading.level, 1)
        XCTAssertEqual(heading.children.count, 1)
        XCTAssertEqual(heading.parent, document)

        let link = try XCTUnwrap(heading.children.first as? Link)
        XCTAssertEqual(link.destination, "https://www.un.org/en/universal-declaration-human-rights/")
        XCTAssertEqual(link.title, "View full version")
        XCTAssertEqual(link.parent, heading)

        let subheading = try XCTUnwrap(document.children.dropFirst().first as? Heading)
        XCTAssertEqual(subheading.level, 2)
        XCTAssertEqual(subheading.children.count, 1)
        XCTAssertEqual(subheading.parent, document)

        let subheadingText = try XCTUnwrap(subheading.children.first as? Text)
        XCTAssertEqual(subheadingText.literal, "Article 1.")
        XCTAssertEqual(subheadingText.parent, subheading)

        let paragraph = try XCTUnwrap(document.children.dropFirst(2).first as? Paragraph)
        XCTAssert(paragraph.description.starts(with: "All human beings"))
        XCTAssertEqual(paragraph.range.lowerBound.line, 5)
        XCTAssertEqual(paragraph.range.lowerBound.column, 1)
        XCTAssertEqual(paragraph.range.upperBound.line, 7)
        XCTAssertEqual(paragraph.range.upperBound.column, 62)
        XCTAssertEqual(paragraph.parent, document)
    }

    // https://github.com/SwiftDocOrg/CommonMark/issues/1
    func testInvalidRange() throws {
        let commonmark = "* #"

        let document = try Document(commonmark)

        let list = try XCTUnwrap(document.children.first as? List)
        let item = try XCTUnwrap(list.children.first)
        let heading = try XCTUnwrap(item.children.first as? Heading)
        XCTAssertEqual(heading.range.lowerBound.line, 1)
        XCTAssertEqual(heading.range.lowerBound.column, 3)
        XCTAssertEqual(heading.range.upperBound.line, 1)
        XCTAssertEqual(heading.range.upperBound.column, 3)
    }

    // https://github.com/SwiftDocOrg/CommonMark/issues/20
    func testParseWithoutOptions() throws {
        let commonmark = """
        single-dash: -
        double-dash: --
        triple-dash: ---
        single-quote: ''
        double-quote: ""
        single-period: .
        double-period: ..
        triple-period: ...
        """

        let document = try Document(commonmark)

        let paragraph = try XCTUnwrap(document.children.first as? Paragraph)
        let paragraphText = paragraph.description.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        // Without smart options we expect no smart replacements to happen:

        XCTAssertEqual(paragraphText, commonmark)
    }

    // https://github.com/SwiftDocOrg/CommonMark/issues/20
    func testParseWithSmartOptions() throws {
        let commonmark = """
        single-dash: -
        double-dash: --
        triple-dash: ---
        single-quote: ''
        double-quote: ""
        single-period: .
        double-period: ..
        triple-period: ...
        """

        var options = Document.ParseOptions()
        options.smartPunctuation = true
        let document = try Document(commonmark, options: options)

        let paragraph = try XCTUnwrap(document.children.first as? Paragraph)
        let paragraphText = paragraph.description.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        // With smart options we expect the following smart replacements:
        //
        // single-dash -> no change
        // double-dash -> n-dash
        // triple-dash -> m-dash
        // single-quote -> curly single quotes
        // double-quote -> curly double quotes
        // single-period -> no change
        // double-period -> no change
        // triple-period -> ellipsis

        XCTAssertEqual(paragraphText, """
        single-dash: -
        double-dash: –
        triple-dash: —
        single-quote: ‘’
        double-quote: “”
        single-period: .
        double-period: ..
        triple-period: …
        """)
    }
}
