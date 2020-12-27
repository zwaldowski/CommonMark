// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecParagraphsTests: XCTestCase {
    func testExample189() throws {
        let markdown = #######"""
        aaa
        
        bbb

        """#######

        let expected = #######"""
        <p>aaa</p>
        <p>bbb</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample190() throws {
        let markdown = #######"""
        aaa
        bbb
        
        ccc
        ddd

        """#######

        let expected = #######"""
        <p>aaa
        bbb</p>
        <p>ccc
        ddd</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample191() throws {
        let markdown = #######"""
        aaa
        
        
        bbb

        """#######

        let expected = #######"""
        <p>aaa</p>
        <p>bbb</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample192() throws {
        let markdown = #######"""
          aaa
         bbb

        """#######

        let expected = #######"""
        <p>aaa
        bbb</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample193() throws {
        let markdown = #######"""
        aaa
                     bbb
                                               ccc

        """#######

        let expected = #######"""
        <p>aaa
        bbb
        ccc</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample194() throws {
        let markdown = #######"""
           aaa
        bbb

        """#######

        let expected = #######"""
        <p>aaa
        bbb</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample195() throws {
        let markdown = #######"""
            aaa
        bbb

        """#######

        let expected = #######"""
        <pre><code>aaa
        </code></pre>
        <p>bbb</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample196() throws {
        let markdown = #######"""
        aaa     
        bbb     

        """#######

        let expected = #######"""
        <p>aaa<br />
        bbb</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
