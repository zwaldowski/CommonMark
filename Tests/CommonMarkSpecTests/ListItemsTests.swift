// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecListItemsTests: XCTestCase {
    func testExample231() throws {
        let markdown = #######"""
        A paragraph
        with two lines.
        
            indented code
        
        > A block quote.

        """#######

        let expected = #######"""
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample232() throws {
        let markdown = #######"""
        1.  A paragraph
            with two lines.
        
                indented code
        
            > A block quote.

        """#######

        let expected = #######"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample233() throws {
        let markdown = #######"""
        - one
        
         two

        """#######

        let expected = #######"""
        <ul>
        <li>one</li>
        </ul>
        <p>two</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample234() throws {
        let markdown = #######"""
        - one
        
          two

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>one</p>
        <p>two</p>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample235() throws {
        let markdown = #######"""
         -    one
        
             two

        """#######

        let expected = #######"""
        <ul>
        <li>one</li>
        </ul>
        <pre><code> two
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample236() throws {
        let markdown = #######"""
         -    one
        
              two

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>one</p>
        <p>two</p>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample237() throws {
        let markdown = #######"""
           > > 1.  one
        >>
        >>     two

        """#######

        let expected = #######"""
        <blockquote>
        <blockquote>
        <ol>
        <li>
        <p>one</p>
        <p>two</p>
        </li>
        </ol>
        </blockquote>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample238() throws {
        let markdown = #######"""
        >>- one
        >>
          >  > two

        """#######

        let expected = #######"""
        <blockquote>
        <blockquote>
        <ul>
        <li>one</li>
        </ul>
        <p>two</p>
        </blockquote>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample239() throws {
        let markdown = #######"""
        -one
        
        2.two

        """#######

        let expected = #######"""
        <p>-one</p>
        <p>2.two</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample240() throws {
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

    func testExample241() throws {
        let markdown = #######"""
        1.  foo
        
            ```
            bar
            ```
        
            baz
        
            > bam

        """#######

        let expected = #######"""
        <ol>
        <li>
        <p>foo</p>
        <pre><code>bar
        </code></pre>
        <p>baz</p>
        <blockquote>
        <p>bam</p>
        </blockquote>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample242() throws {
        let markdown = #######"""
        - Foo
        
              bar
        
        
              baz

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>Foo</p>
        <pre><code>bar
        
        
        baz
        </code></pre>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample243() throws {
        let markdown = #######"""
        123456789. ok

        """#######

        let expected = #######"""
        <ol start="123456789">
        <li>ok</li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample244() throws {
        let markdown = #######"""
        1234567890. not ok

        """#######

        let expected = #######"""
        <p>1234567890. not ok</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample245() throws {
        let markdown = #######"""
        0. ok

        """#######

        let expected = #######"""
        <ol start="0">
        <li>ok</li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample246() throws {
        let markdown = #######"""
        003. ok

        """#######

        let expected = #######"""
        <ol start="3">
        <li>ok</li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample247() throws {
        let markdown = #######"""
        -1. not ok

        """#######

        let expected = #######"""
        <p>-1. not ok</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample248() throws {
        let markdown = #######"""
        - foo
        
              bar

        """#######

        let expected = #######"""
        <ul>
        <li>
        <p>foo</p>
        <pre><code>bar
        </code></pre>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample249() throws {
        let markdown = #######"""
          10.  foo
        
                   bar

        """#######

        let expected = #######"""
        <ol start="10">
        <li>
        <p>foo</p>
        <pre><code>bar
        </code></pre>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample250() throws {
        let markdown = #######"""
            indented code
        
        paragraph
        
            more code

        """#######

        let expected = #######"""
        <pre><code>indented code
        </code></pre>
        <p>paragraph</p>
        <pre><code>more code
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample251() throws {
        let markdown = #######"""
        1.     indented code
        
           paragraph
        
               more code

        """#######

        let expected = #######"""
        <ol>
        <li>
        <pre><code>indented code
        </code></pre>
        <p>paragraph</p>
        <pre><code>more code
        </code></pre>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample252() throws {
        let markdown = #######"""
        1.      indented code
        
           paragraph
        
               more code

        """#######

        let expected = #######"""
        <ol>
        <li>
        <pre><code> indented code
        </code></pre>
        <p>paragraph</p>
        <pre><code>more code
        </code></pre>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample253() throws {
        let markdown = #######"""
           foo
        
        bar

        """#######

        let expected = #######"""
        <p>foo</p>
        <p>bar</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample254() throws {
        let markdown = #######"""
        -    foo
        
          bar

        """#######

        let expected = #######"""
        <ul>
        <li>foo</li>
        </ul>
        <p>bar</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample255() throws {
        let markdown = #######"""
        -  foo
        
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

    func testExample256() throws {
        let markdown = #######"""
        -
          foo
        -
          ```
          bar
          ```
        -
              baz

        """#######

        let expected = #######"""
        <ul>
        <li>foo</li>
        <li>
        <pre><code>bar
        </code></pre>
        </li>
        <li>
        <pre><code>baz
        </code></pre>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample257() throws {
        let markdown = #######"""
        -   
          foo

        """#######

        let expected = #######"""
        <ul>
        <li>foo</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample258() throws {
        let markdown = #######"""
        -
        
          foo

        """#######

        let expected = #######"""
        <ul>
        <li></li>
        </ul>
        <p>foo</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample259() throws {
        let markdown = #######"""
        - foo
        -
        - bar

        """#######

        let expected = #######"""
        <ul>
        <li>foo</li>
        <li></li>
        <li>bar</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample260() throws {
        let markdown = #######"""
        - foo
        -   
        - bar

        """#######

        let expected = #######"""
        <ul>
        <li>foo</li>
        <li></li>
        <li>bar</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample261() throws {
        let markdown = #######"""
        1. foo
        2.
        3. bar

        """#######

        let expected = #######"""
        <ol>
        <li>foo</li>
        <li></li>
        <li>bar</li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample262() throws {
        let markdown = #######"""
        *

        """#######

        let expected = #######"""
        <ul>
        <li></li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample263() throws {
        let markdown = #######"""
        foo
        *
        
        foo
        1.

        """#######

        let expected = #######"""
        <p>foo
        *</p>
        <p>foo
        1.</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample264() throws {
        let markdown = #######"""
         1.  A paragraph
             with two lines.
        
                 indented code
        
             > A block quote.

        """#######

        let expected = #######"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample265() throws {
        let markdown = #######"""
          1.  A paragraph
              with two lines.
        
                  indented code
        
              > A block quote.

        """#######

        let expected = #######"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample266() throws {
        let markdown = #######"""
           1.  A paragraph
               with two lines.
        
                   indented code
        
               > A block quote.

        """#######

        let expected = #######"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample267() throws {
        let markdown = #######"""
            1.  A paragraph
                with two lines.
        
                    indented code
        
                > A block quote.

        """#######

        let expected = #######"""
        <pre><code>1.  A paragraph
            with two lines.
        
                indented code
        
            &gt; A block quote.
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample268() throws {
        let markdown = #######"""
          1.  A paragraph
        with two lines.
        
                  indented code
        
              > A block quote.

        """#######

        let expected = #######"""
        <ol>
        <li>
        <p>A paragraph
        with two lines.</p>
        <pre><code>indented code
        </code></pre>
        <blockquote>
        <p>A block quote.</p>
        </blockquote>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample269() throws {
        let markdown = #######"""
          1.  A paragraph
            with two lines.

        """#######

        let expected = #######"""
        <ol>
        <li>A paragraph
        with two lines.</li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample270() throws {
        let markdown = #######"""
        > 1. > Blockquote
        continued here.

        """#######

        let expected = #######"""
        <blockquote>
        <ol>
        <li>
        <blockquote>
        <p>Blockquote
        continued here.</p>
        </blockquote>
        </li>
        </ol>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample271() throws {
        let markdown = #######"""
        > 1. > Blockquote
        > continued here.

        """#######

        let expected = #######"""
        <blockquote>
        <ol>
        <li>
        <blockquote>
        <p>Blockquote
        continued here.</p>
        </blockquote>
        </li>
        </ol>
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample272() throws {
        let markdown = #######"""
        - foo
          - bar
            - baz
              - boo

        """#######

        let expected = #######"""
        <ul>
        <li>foo
        <ul>
        <li>bar
        <ul>
        <li>baz
        <ul>
        <li>boo</li>
        </ul>
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

    func testExample273() throws {
        let markdown = #######"""
        - foo
         - bar
          - baz
           - boo

        """#######

        let expected = #######"""
        <ul>
        <li>foo</li>
        <li>bar</li>
        <li>baz</li>
        <li>boo</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample274() throws {
        let markdown = #######"""
        10) foo
            - bar

        """#######

        let expected = #######"""
        <ol start="10">
        <li>foo
        <ul>
        <li>bar</li>
        </ul>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample275() throws {
        let markdown = #######"""
        10) foo
           - bar

        """#######

        let expected = #######"""
        <ol start="10">
        <li>foo</li>
        </ol>
        <ul>
        <li>bar</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample276() throws {
        let markdown = #######"""
        - - foo

        """#######

        let expected = #######"""
        <ul>
        <li>
        <ul>
        <li>foo</li>
        </ul>
        </li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample277() throws {
        let markdown = #######"""
        1. - 2. foo

        """#######

        let expected = #######"""
        <ol>
        <li>
        <ul>
        <li>
        <ol start="2">
        <li>foo</li>
        </ol>
        </li>
        </ul>
        </li>
        </ol>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample278() throws {
        let markdown = #######"""
        - # Foo
        - Bar
          ---
          baz

        """#######

        let expected = #######"""
        <ul>
        <li>
        <h1>Foo</h1>
        </li>
        <li>
        <h2>Bar</h2>
        baz</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
