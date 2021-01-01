import XCTest
import CommonMark

final class ContainerManipulationTests: XCTestCase {
    func testContainerOfBlocksManipulation() throws {
        let document = try Document(Fixtures.udhr)

        XCTAssertEqual(document.children.count, 3)
        let heading = try XCTUnwrap(document.children.first as? Heading)
        XCTAssertEqual(heading.level, 1)
        let subheading = try XCTUnwrap(document.children.dropFirst().first as? Heading)
        XCTAssertEqual(subheading.level, 2)
        let paragraph = try XCTUnwrap(document.children.dropFirst(2).first as? Paragraph)
        XCTAssert(paragraph.description.starts(with: "All human beings"))

        let newParagraph = Paragraph(text:
           #"""
           Everyone is entitled to all the rights and freedoms set forth in this Declaration, 
           without distinction of any kind, such as race, colour, sex, language, religion, 
           political or other opinion, national or social origin, property, birth or other status.
           """#)
        document.children.insert(newParagraph, after: paragraph)
        XCTAssertEqual(document.children.count, 4)
        XCTAssertEqual(newParagraph, document.children.dropFirst(3).first as? Paragraph)

        let newSubheading = Heading(level: 2, text: "Article 2.")
        document.children.insert(newSubheading, before: newParagraph)
        XCTAssertEqual(document.children.count, 5)
        XCTAssertEqual(newSubheading, document.children.dropFirst(3).first as? Heading)
    }
    
    func testContainerOfInlineElementsManipulation() throws {
        let document = try Document(Fixtures.udhr)

        let paragraph = try XCTUnwrap(document.children.dropFirst(2).first as? Paragraph)
        XCTAssertEqual(paragraph.children.count, 5)

        let text = Text(literal: "Article 1:")
        paragraph.children.insert(text, before: paragraph.children.first!)
        XCTAssertEqual(paragraph.children.first as? Text, text)

        let lineBreak = SoftLineBreak()
        paragraph.children.insert(lineBreak, after: text)
        XCTAssertEqual(paragraph.children.dropFirst().first as? SoftLineBreak, lineBreak)
    }
    
    func testListManipulation() throws {
        let document = try Document(
            #"""
            * First
            * Second
            * Fourth
            """#)
        
        let list = try XCTUnwrap(document.children.first as? List)
        XCTAssertEqual(list.children.count, 3)

        let third = List.Item(children: [Text(literal: "Third")])
        list.children.insert(third, before: list.children.dropFirst(2).first!)
        XCTAssertEqual(list.children.dropFirst(2).first, third)

        let fifth = List.Item(children: [Text(literal: "Fifth")])
        list.children.insert(fifth, after: list.children.dropFirst(3).first!)
        XCTAssertEqual(list.children.dropFirst(4).first, fifth)
    }

    func testListItemManipulation() throws {
        let listItem = List.Item(children: [Paragraph(text: "First")])
        let secondChild = Paragraph(text: "Second")
        listItem.children.insert(secondChild, after: listItem.children.first!)
        XCTAssertEqual(listItem.children.dropFirst().first as? Paragraph, secondChild)

        let thirdChild = Paragraph(text: "Third")
        listItem.children.insert(thirdChild, before: listItem.children.first!)
        XCTAssertEqual(listItem.children.first as? Paragraph, thirdChild)
    }
}
