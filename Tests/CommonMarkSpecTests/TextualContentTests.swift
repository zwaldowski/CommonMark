// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecTextualContentTests: XCTestCase {
    func testExample671() throws {
        let markdown = #######"""
        hello $.;'there

        """#######

        let expected = #######"""
        <p>hello $.;'there</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample672() throws {
        let markdown = #######"""
        Foo χρῆν

        """#######

        let expected = #######"""
        <p>Foo χρῆν</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample673() throws {
        let markdown = #######"""
        Multiple     spaces

        """#######

        let expected = #######"""
        <p>Multiple     spaces</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
