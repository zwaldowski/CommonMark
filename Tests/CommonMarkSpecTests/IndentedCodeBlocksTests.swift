// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecIndentedCodeBlocksTests: XCTestCase {
    func testExample77() throws {
        let markdown = #######"""
            a simple
              indented code block

        """#######

        let expected = #######"""
        <pre><code>a simple
          indented code block
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample78() throws {
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

    func testExample79() throws {
        let markdown = #######"""
        1.  foo
        
            - bar

        """#######

        let expected = #######"""
        <ol>
        <li>
        <p>foo</p>
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

    func testExample80() throws {
        let markdown = #######"""
            <a/>
            *hi*
        
            - one

        """#######

        let expected = #######"""
        <pre><code>&lt;a/&gt;
        *hi*
        
        - one
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample81() throws {
        let markdown = #######"""
            chunk1
        
            chunk2
          
         
         
            chunk3

        """#######

        let expected = #######"""
        <pre><code>chunk1
        
        chunk2
        
        
        
        chunk3
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample82() throws {
        let markdown = #######"""
            chunk1
              
              chunk2

        """#######

        let expected = #######"""
        <pre><code>chunk1
          
          chunk2
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample83() throws {
        let markdown = #######"""
        Foo
            bar
        

        """#######

        let expected = #######"""
        <p>Foo
        bar</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample84() throws {
        let markdown = #######"""
            foo
        bar

        """#######

        let expected = #######"""
        <pre><code>foo
        </code></pre>
        <p>bar</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample85() throws {
        let markdown = #######"""
        # Heading
            foo
        Heading
        ------
            foo
        ----

        """#######

        let expected = #######"""
        <h1>Heading</h1>
        <pre><code>foo
        </code></pre>
        <h2>Heading</h2>
        <pre><code>foo
        </code></pre>
        <hr />

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample86() throws {
        let markdown = #######"""
                foo
            bar

        """#######

        let expected = #######"""
        <pre><code>    foo
        bar
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample87() throws {
        let markdown = #######"""
        
            
            foo
            
        

        """#######

        let expected = #######"""
        <pre><code>foo
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample88() throws {
        let markdown = #######"""
            foo  

        """#######

        let expected = #######"""
        <pre><code>foo  
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
