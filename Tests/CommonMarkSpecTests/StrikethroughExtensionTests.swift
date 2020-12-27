// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecStrikethroughExtensionTests: XCTestCase {
    func testExample491() throws {
        let markdown = #######"""
        ~~Hi~~ Hello, world!

        """#######

        let expected = #######"""
        <p><del>Hi</del> Hello, world!</p>

        """#######

        var options = Document.ParseOptions()
        options.strikethrough = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample492() throws {
        let markdown = #######"""
        This ~~has a
        
        new paragraph~~.

        """#######

        let expected = #######"""
        <p>This ~~has a</p>
        <p>new paragraph~~.</p>

        """#######

        var options = Document.ParseOptions()
        options.strikethrough = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
