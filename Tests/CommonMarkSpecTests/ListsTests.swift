// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecListsTests: XCTestCase {
    func testExample281() throws {
        let markdown = #######"""
        - foo
        - bar
        + baz

        """#######

        let expected = #######"""
        <ul>
        <li>foo</li>
        <li>bar</li>
        </ul>
        <ul>
        <li>baz</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample282() throws {
        let markdown = #######"""
        1. foo
        2. bar
        3) baz

        """#######

        let expected = #######"""
        <ol>
        <li>foo</li>
        <li>bar</li>
        </ol>
        <ol start="3">
        <li>baz</li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample283() throws {
        let markdown = #######"""
        Foo
        - bar
        - baz

        """#######

        let expected = #######"""
        <p>Foo</p>
        <ul>
        <li>bar</li>
        <li>baz</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample284() throws {
        let markdown = #######"""
        The number of windows in my house is
        14.  The number of doors is 6.

        """#######

        let expected = #######"""
        <p>The number of windows in my house is
        14.  The number of doors is 6.</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample285() throws {
        let markdown = #######"""
        The number of windows in my house is
        1.  The number of doors is 6.

        """#######

        let expected = #######"""
        <p>The number of windows in my house is</p>
        <ol>
        <li>The number of doors is 6.</li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample286() throws {
        let markdown = #######"""
        - foo
        
        - bar
        
        
        - baz

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>foo</p>
        </li>
        <li>
        <p>bar</p>
        </li>
        <li>
        <p>baz</p>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample287() throws {
        let markdown = #######"""
        - foo
          - bar
            - baz
        
        
              bim

        """#######

        let expected = #######"""
        <ul>
        <li>foo
        <ul>
        <li>bar
        <ul>
        <li>
        <p>baz</p>
        <p>bim</p>
        </li>
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

    func testExample288() throws {
        let markdown = #######"""
        - foo
        - bar
        
        <!-- -->
        
        - baz
        - bim

        """#######

        let expected = #######"""
        <ul>
        <li>foo</li>
        <li>bar</li>
        </ul>
        <!-- -->
        <ul>
        <li>baz</li>
        <li>bim</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample289() throws {
        let markdown = #######"""
        -   foo
        
            notcode
        
        -   foo
        
        <!-- -->
        
            code

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>foo</p>
        <p>notcode</p>
        </li>
        <li>
        <p>foo</p>
        </li>
        </ul>
        <!-- -->
        <pre><code>code
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample290() throws {
        let markdown = #######"""
        - a
         - b
          - c
           - d
          - e
         - f
        - g

        """#######

        let expected = #######"""
        <ul>
        <li>a</li>
        <li>b</li>
        <li>c</li>
        <li>d</li>
        <li>e</li>
        <li>f</li>
        <li>g</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample291() throws {
        let markdown = #######"""
        1. a
        
          2. b
        
           3. c

        """#######

        let expected = #######"""
        <ol>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        <li>
        <p>c</p>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample292() throws {
        let markdown = #######"""
        - a
         - b
          - c
           - d
            - e

        """#######

        let expected = #######"""
        <ul>
        <li>a</li>
        <li>b</li>
        <li>c</li>
        <li>d
        - e</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample293() throws {
        let markdown = #######"""
        1. a
        
          2. b
        
            3. c

        """#######

        let expected = #######"""
        <ol>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        </ol>
        <pre><code>3. c
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample294() throws {
        let markdown = #######"""
        - a
        - b
        
        - c

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        <li>
        <p>c</p>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample295() throws {
        let markdown = #######"""
        * a
        *
        
        * c

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li></li>
        <li>
        <p>c</p>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample296() throws {
        let markdown = #######"""
        - a
        - b
        
          c
        - d

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        <p>c</p>
        </li>
        <li>
        <p>d</p>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample297() throws {
        let markdown = #######"""
        - a
        - b
        
          [ref]: /url
        - d

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>a</p>
        </li>
        <li>
        <p>b</p>
        </li>
        <li>
        <p>d</p>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample298() throws {
        let markdown = #######"""
        - a
        - ```
          b
        
        
          ```
        - c

        """#######

        let expected = #######"""
        <ul>
        <li>a</li>
        <li>
        <pre><code>b
        
        
        </code></pre>
        </li>
        <li>c</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample299() throws {
        let markdown = #######"""
        - a
          - b
        
            c
        - d

        """#######

        let expected = #######"""
        <ul>
        <li>a
        <ul>
        <li>
        <p>b</p>
        <p>c</p>
        </li>
        </ul>
        </li>
        <li>d</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample300() throws {
        let markdown = #######"""
        * a
          > b
          >
        * c

        """#######

        let expected = #######"""
        <ul>
        <li>a
        <blockquote>
        <p>b</p>
        </blockquote>
        </li>
        <li>c</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample301() throws {
        let markdown = #######"""
        - a
          > b
          ```
          c
          ```
        - d

        """#######

        let expected = #######"""
        <ul>
        <li>a
        <blockquote>
        <p>b</p>
        </blockquote>
        <pre><code>c
        </code></pre>
        </li>
        <li>d</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample302() throws {
        let markdown = #######"""
        - a

        """#######

        let expected = #######"""
        <ul>
        <li>a</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample303() throws {
        let markdown = #######"""
        - a
          - b

        """#######

        let expected = #######"""
        <ul>
        <li>a
        <ul>
        <li>b</li>
        </ul>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample304() throws {
        let markdown = #######"""
        1. ```
           foo
           ```
        
           bar

        """#######

        let expected = #######"""
        <ol>
        <li>
        <pre><code>foo
        </code></pre>
        <p>bar</p>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample305() throws {
        let markdown = #######"""
        * foo
          * bar
        
          baz

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>foo</p>
        <ul>
        <li>bar</li>
        </ul>
        <p>baz</p>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample306() throws {
        let markdown = #######"""
        - a
          - b
          - c
        
        - d
          - e
          - f

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>a</p>
        <ul>
        <li>b</li>
        <li>c</li>
        </ul>
        </li>
        <li>
        <p>d</p>
        <ul>
        <li>e</li>
        <li>f</li>
        </ul>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
