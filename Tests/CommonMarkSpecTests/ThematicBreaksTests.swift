// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecThematicBreaksTests: XCTestCase {
    func testExample13() throws {
        let markdown = #######"""
        ***
        ---
        ___

        """#######

        let expected = #######"""
        <hr />
        <hr />
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample14() throws {
        let markdown = #######"""
        +++

        """#######

        let expected = #######"""
        <p>+++</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample15() throws {
        let markdown = #######"""
        ===

        """#######

        let expected = #######"""
        <p>===</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample16() throws {
        let markdown = #######"""
        --
        **
        __

        """#######

        let expected = #######"""
        <p>--
        **
        __</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample17() throws {
        let markdown = #######"""
         ***
          ***
           ***

        """#######

        let expected = #######"""
        <hr />
        <hr />
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample18() throws {
        let markdown = #######"""
            ***

        """#######

        let expected = #######"""
        <pre><code>***
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample19() throws {
        let markdown = #######"""
        Foo
            ***

        """#######

        let expected = #######"""
        <p>Foo
        ***</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample20() throws {
        let markdown = #######"""
        _____________________________________

        """#######

        let expected = #######"""
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample21() throws {
        let markdown = #######"""
         - - -

        """#######

        let expected = #######"""
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample22() throws {
        let markdown = #######"""
         **  * ** * ** * **

        """#######

        let expected = #######"""
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample23() throws {
        let markdown = #######"""
        -     -      -      -

        """#######

        let expected = #######"""
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample24() throws {
        let markdown = #######"""
        - - - -    

        """#######

        let expected = #######"""
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample25() throws {
        let markdown = #######"""
        _ _ _ _ a
        
        a------
        
        ---a---

        """#######

        let expected = #######"""
        <p>_ _ _ _ a</p>
        <p>a------</p>
        <p>---a---</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample26() throws {
        let markdown = #######"""
         *-*

        """#######

        let expected = #######"""
        <p><em>-</em></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample27() throws {
        let markdown = #######"""
        - foo
        ***
        - bar

        """#######

        let expected = #######"""
        <ul>
        <li>foo</li>
        </ul>
        <hr />
        <ul>
        <li>bar</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample28() throws {
        let markdown = #######"""
        Foo
        ***
        bar

        """#######

        let expected = #######"""
        <p>Foo</p>
        <hr />
        <p>bar</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample29() throws {
        let markdown = #######"""
        Foo
        ---
        bar

        """#######

        let expected = #######"""
        <h2>Foo</h2>
        <p>bar</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample30() throws {
        let markdown = #######"""
        * Foo
        * * *
        * Bar

        """#######

        let expected = #######"""
        <ul>
        <li>Foo</li>
        </ul>
        <hr />
        <ul>
        <li>Bar</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample31() throws {
        let markdown = #######"""
        - Foo
        - * * *

        """#######

        let expected = #######"""
        <ul>
        <li>Foo</li>
        <li>
        <hr />
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
