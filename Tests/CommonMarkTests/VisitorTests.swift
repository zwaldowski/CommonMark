import XCTest
import CommonMark

class VisitorTests: XCTestCase {
    struct CountNodes: Visitor {
        var count = 0

        mutating func visit(_ node: Node) {
            count += 1
        }
    }

    func testDefaultVisit() throws {
        let document = try Document(Fixtures.udhr)
        var counter = CountNodes()
        document.accept(&counter)
        XCTAssertEqual(counter.count, 12)
    }

    struct CountEverything: Visitor {
        var count = 0

        mutating func visit(blockQuote: BlockQuote) {
            count += 1
            descendInto(blockQuote)
        }

        mutating func visit(code: Code) {
            count += 1
        }

        mutating func visit(codeBlock: CodeBlock) {
            count += 1
            descendInto(codeBlock)
        }

        mutating func visit(customBlock: CustomBlock) {
            count += 1
            descendInto(customBlock)
        }

        mutating func visit(customInline: CustomInline) {
            count += 1
            descendInto(customInline)
        }

        mutating func visit(document: Document) {
            count += 1
            descendInto(document)
        }

        mutating func visit(emphasis: Emphasis) {
            count += 1
            descendInto(emphasis)
        }

        mutating func visit(frontmatter: Frontmatter) {
            count += 1
        }

        mutating func visit(hardLineBreak: HardLineBreak) {
            count += 1
        }

        mutating func visit(heading: Heading) {
            count += 1
            descendInto(heading)
        }

        mutating func visit(htmlBlock: HTMLBlock) {
            count += 1
            descendInto(htmlBlock)
        }

        mutating func visit(image: Image) {
            count += 1
        }

        mutating func visit(link: Link) {
            count += 1
            descendInto(link)
        }

        mutating func visit(list: List) {
            count += 1
            descendInto(list)
        }

        mutating func visit(listItem: List.Item) {
            count += 1
            descendInto(listItem)
        }

        mutating func visit(paragraph: Paragraph) {
            count += 1
            descendInto(paragraph)
        }

        mutating func visit(rawHTML: RawHTML) {
            count += 1
        }

        mutating func visit(softLineBreak: SoftLineBreak) {
            count += 1
        }

        mutating func visit(strikethrough: Strikethrough) {
            count += 1
            descendInto(strikethrough)
        }

        mutating func visit(strong: Strong) {
            count += 1
            descendInto(strong)
        }

        mutating func visit(table: Table) {
            count += 1
            descendInto(table)
        }

        mutating func visit(tableCell: Table.Cell) {
            count += 1
            descendInto(tableCell)
        }

        mutating func visit(tableHead: Table.Head) {
            count += 1
            descendInto(tableHead)
        }

        mutating func visit(tableRow: Table.Row) {
            count += 1
            descendInto(tableRow)
        }

        mutating func visit(text: Text) {
            count += 1
        }

        mutating func visit(thematicBreak: ThematicBreak) {
            count += 1
        }
    }

    func testVisitEverything() throws {
        let document = try Document(Fixtures.udhr)
        var counter = CountEverything()
        document.accept(&counter)
        XCTAssertEqual(counter.count, 12)
    }
}
