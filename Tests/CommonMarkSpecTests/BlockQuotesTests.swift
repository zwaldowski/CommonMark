// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecBlockQuotesTests: XCTestCase {
    func testExample206() throws {
        let markdown = #######"""
        > # Foo
        > bar
        > baz

        """#######

        let expected = #######"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample207() throws {
        let markdown = #######"""
        ># Foo
        >bar
        > baz

        """#######

        let expected = #######"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample208() throws {
        let markdown = #######"""
           > # Foo
           > bar
         > baz

        """#######

        let expected = #######"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample209() throws {
        let markdown = #######"""
            > # Foo
            > bar
            > baz

        """#######

        let expected = #######"""
        <pre><code>&gt; # Foo
        &gt; bar
        &gt; baz
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample210() throws {
        let markdown = #######"""
        > # Foo
        > bar
        baz

        """#######

        let expected = #######"""
        <blockquote>
        <h1>Foo</h1>
        <p>bar
        baz</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample211() throws {
        let markdown = #######"""
        > bar
        baz
        > foo

        """#######

        let expected = #######"""
        <blockquote>
        <p>bar
        baz
        foo</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample212() throws {
        let markdown = #######"""
        > foo
        ---

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

    func testExample213() throws {
        let markdown = #######"""
        > - foo
        - bar

        """#######

        let expected = #######"""
        <blockquote>
        <ul>
        <li>foo</li>
        </ul>
        </blockquote>
        <ul>
        <li>bar</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample214() throws {
        let markdown = #######"""
        >     foo
            bar

        """#######

        let expected = #######"""
        <blockquote>
        <pre><code>foo
        </code></pre>
        </blockquote>
        <pre><code>bar
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample215() throws {
        let markdown = #######"""
        > ```
        foo
        ```

        """#######

        let expected = #######"""
        <blockquote>
        <pre><code></code></pre>
        </blockquote>
        <p>foo</p>
        <pre><code></code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample216() throws {
        let markdown = #######"""
        > foo
            - bar

        """#######

        let expected = #######"""
        <blockquote>
        <p>foo
        - bar</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample217() throws {
        let markdown = #######"""
        >

        """#######

        let expected = #######"""
        <blockquote>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample218() throws {
        let markdown = #######"""
        >
        >  
        > 

        """#######

        let expected = #######"""
        <blockquote>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample219() throws {
        let markdown = #######"""
        >
        > foo
        >  

        """#######

        let expected = #######"""
        <blockquote>
        <p>foo</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample220() throws {
        let markdown = #######"""
        > foo
        
        > bar

        """#######

        let expected = #######"""
        <blockquote>
        <p>foo</p>
        </blockquote>
        <blockquote>
        <p>bar</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample221() throws {
        let markdown = #######"""
        > foo
        > bar

        """#######

        let expected = #######"""
        <blockquote>
        <p>foo
        bar</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample222() throws {
        let markdown = #######"""
        > foo
        >
        > bar

        """#######

        let expected = #######"""
        <blockquote>
        <p>foo</p>
        <p>bar</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample223() throws {
        let markdown = #######"""
        foo
        > bar

        """#######

        let expected = #######"""
        <p>foo</p>
        <blockquote>
        <p>bar</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample224() throws {
        let markdown = #######"""
        > aaa
        ***
        > bbb

        """#######

        let expected = #######"""
        <blockquote>
        <p>aaa</p>
        </blockquote>
        <hr />
        <blockquote>
        <p>bbb</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample225() throws {
        let markdown = #######"""
        > bar
        baz

        """#######

        let expected = #######"""
        <blockquote>
        <p>bar
        baz</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample226() throws {
        let markdown = #######"""
        > bar
        
        baz

        """#######

        let expected = #######"""
        <blockquote>
        <p>bar</p>
        </blockquote>
        <p>baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample227() throws {
        let markdown = #######"""
        > bar
        >
        baz

        """#######

        let expected = #######"""
        <blockquote>
        <p>bar</p>
        </blockquote>
        <p>baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample228() throws {
        let markdown = #######"""
        > > > foo
        bar

        """#######

        let expected = #######"""
        <blockquote>
        <blockquote>
        <blockquote>
        <p>foo
        bar</p>
        </blockquote>
        </blockquote>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample229() throws {
        let markdown = #######"""
        >>> foo
        > bar
        >>baz

        """#######

        let expected = #######"""
        <blockquote>
        <blockquote>
        <blockquote>
        <p>foo
        bar
        baz</p>
        </blockquote>
        </blockquote>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample230() throws {
        let markdown = #######"""
        >     code
        
        >    not code

        """#######

        let expected = #######"""
        <blockquote>
        <pre><code>code
        </code></pre>
        </blockquote>
        <blockquote>
        <p>not code</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
