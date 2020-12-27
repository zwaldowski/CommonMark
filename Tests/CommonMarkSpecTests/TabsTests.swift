// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecTabsTests: XCTestCase {
    func testExample1() throws {
        let markdown = #######"""
        	foo	baz		bim

        """#######

        let expected = #######"""
        <pre><code>foo	baz		bim
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample2() throws {
        let markdown = #######"""
          	foo	baz		bim

        """#######

        let expected = #######"""
        <pre><code>foo	baz		bim
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample3() throws {
        let markdown = #######"""
            a	a
            ὐ	a

        """#######

        let expected = #######"""
        <pre><code>a	a
        ὐ	a
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample4() throws {
        let markdown = #######"""
          - foo
        
        	bar

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>foo</p>
        <p>bar</p>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample5() throws {
        let markdown = #######"""
        - foo
        
        		bar

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>foo</p>
        <pre><code>  bar
        </code></pre>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample6() throws {
        let markdown = #######"""
        >		foo

        """#######

        let expected = #######"""
        <blockquote>
        <pre><code>  foo
        </code></pre>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample7() throws {
        let markdown = #######"""
        -		foo

        """#######

        let expected = #######"""
        <ul>
        <li>
        <pre><code>  foo
        </code></pre>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample8() throws {
        let markdown = #######"""
            foo
        	bar

        """#######

        let expected = #######"""
        <pre><code>foo
        bar
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample9() throws {
        let markdown = #######"""
         - foo
           - bar
        	 - baz

        """#######

        let expected = #######"""
        <ul>
        <li>foo
        <ul>
        <li>bar
        <ul>
        <li>baz</li>
        </ul>
        </li>
        </ul>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample10() throws {
        let markdown = #######"""
        #	Foo

        """#######

        let expected = #######"""
        <h1>Foo</h1>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample11() throws {
        let markdown = #######"""
        *	*	*	

        """#######

        let expected = #######"""
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
