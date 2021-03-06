// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecSetextHeadingsTests: XCTestCase {
    func testExample50() throws {
        let markdown = #######"""
        Foo *bar*
        =========
        
        Foo *bar*
        ---------

        """#######

        let expected = #######"""
        <h1>Foo <em>bar</em></h1>
        <h2>Foo <em>bar</em></h2>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample51() throws {
        let markdown = #######"""
        Foo *bar
        baz*
        ====

        """#######

        let expected = #######"""
        <h1>Foo <em>bar
        baz</em></h1>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample52() throws {
        let markdown = #######"""
          Foo *bar
        baz*	
        ====

        """#######

        let expected = #######"""
        <h1>Foo <em>bar
        baz</em></h1>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample53() throws {
        let markdown = #######"""
        Foo
        -------------------------
        
        Foo
        =

        """#######

        let expected = #######"""
        <h2>Foo</h2>
        <h1>Foo</h1>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample54() throws {
        let markdown = #######"""
           Foo
        ---
        
          Foo
        -----
        
          Foo
          ===

        """#######

        let expected = #######"""
        <h2>Foo</h2>
        <h2>Foo</h2>
        <h1>Foo</h1>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample55() throws {
        let markdown = #######"""
            Foo
            ---
        
            Foo
        ---

        """#######

        let expected = #######"""
        <pre><code>Foo
        ---
        
        Foo
        </code></pre>
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample56() throws {
        let markdown = #######"""
        Foo
           ----      

        """#######

        let expected = #######"""
        <h2>Foo</h2>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample57() throws {
        let markdown = #######"""
        Foo
            ---

        """#######

        let expected = #######"""
        <p>Foo
        ---</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample58() throws {
        let markdown = #######"""
        Foo
        = =
        
        Foo
        --- -

        """#######

        let expected = #######"""
        <p>Foo
        = =</p>
        <p>Foo</p>
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample59() throws {
        let markdown = #######"""
        Foo  
        -----

        """#######

        let expected = #######"""
        <h2>Foo</h2>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample60() throws {
        let markdown = #######"""
        Foo\
        ----

        """#######

        let expected = #######"""
        <h2>Foo\</h2>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample61() throws {
        let markdown = #######"""
        `Foo
        ----
        `
        
        <a title="a lot
        ---
        of dashes"/>

        """#######

        let expected = #######"""
        <h2>`Foo</h2>
        <p>`</p>
        <h2>&lt;a title=&quot;a lot</h2>
        <p>of dashes&quot;/&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample62() throws {
        let markdown = #######"""
        > Foo
        ---

        """#######

        let expected = #######"""
        <blockquote>
        <p>Foo</p>
        </blockquote>
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample63() throws {
        let markdown = #######"""
        > foo
        bar
        ===

        """#######

        let expected = #######"""
        <blockquote>
        <p>foo
        bar
        ===</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample64() throws {
        let markdown = #######"""
        - Foo
        ---

        """#######

        let expected = #######"""
        <ul>
        <li>Foo</li>
        </ul>
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample65() throws {
        let markdown = #######"""
        Foo
        Bar
        ---

        """#######

        let expected = #######"""
        <h2>Foo
        Bar</h2>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample66() throws {
        let markdown = #######"""
        ---
        Foo
        ---
        Bar
        ---
        Baz

        """#######

        let expected = #######"""
        <hr />
        <h2>Foo</h2>
        <h2>Bar</h2>
        <p>Baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample67() throws {
        let markdown = #######"""
        
        ====

        """#######

        let expected = #######"""
        <p>====</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample68() throws {
        let markdown = #######"""
        ---
        ---

        """#######

        let expected = #######"""
        <hr />
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample69() throws {
        let markdown = #######"""
        - foo
        -----

        """#######

        let expected = #######"""
        <ul>
        <li>foo</li>
        </ul>
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample70() throws {
        let markdown = #######"""
            foo
        ---

        """#######

        let expected = #######"""
        <pre><code>foo
        </code></pre>
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample71() throws {
        let markdown = #######"""
        > foo
        -----

        """#######

        let expected = #######"""
        <blockquote>
        <p>foo</p>
        </blockquote>
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample72() throws {
        let markdown = #######"""
        \> foo
        ------

        """#######

        let expected = #######"""
        <h2>&gt; foo</h2>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample73() throws {
        let markdown = #######"""
        Foo
        
        bar
        ---
        baz

        """#######

        let expected = #######"""
        <p>Foo</p>
        <h2>bar</h2>
        <p>baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample74() throws {
        let markdown = #######"""
        Foo
        bar
        
        ---
        
        baz

        """#######

        let expected = #######"""
        <p>Foo
        bar</p>
        <hr />
        <p>baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample75() throws {
        let markdown = #######"""
        Foo
        bar
        * * *
        baz

        """#######

        let expected = #######"""
        <p>Foo
        bar</p>
        <hr />
        <p>baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample76() throws {
        let markdown = #######"""
        Foo
        bar
        \---
        baz

        """#######

        let expected = #######"""
        <p>Foo
        bar
        ---
        baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
