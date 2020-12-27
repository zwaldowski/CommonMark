// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecSoftLineBreaksTests: XCTestCase {
    func testExample669() throws {
        let markdown = #######"""
        foo
        baz

        """#######

        let expected = #######"""
        <p>foo
        baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample670() throws {
        let markdown = #######"""
        foo 
         baz

        """#######

        let expected = #######"""
        <p>foo
        baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
