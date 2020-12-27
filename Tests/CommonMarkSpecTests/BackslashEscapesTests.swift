// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecBackslashEscapesTests: XCTestCase {
    func testExample308() throws {
        let markdown = #######"""
        \!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~

        """#######

        let expected = #######"""
        <p>!&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample309() throws {
        let markdown = #######"""
        \	\A\a\ \3\φ\«

        """#######

        let expected = #######"""
        <p>\	\A\a\ \3\φ\«</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample310() throws {
        let markdown = #######"""
        \*not emphasized*
        \<br/> not a tag
        \[not a link](/foo)
        \`not code`
        1\. not a list
        \* not a list
        \# not a heading
        \[foo]: /url "not a reference"
        \&ouml; not a character entity

        """#######

        let expected = #######"""
        <p>*not emphasized*
        &lt;br/&gt; not a tag
        [not a link](/foo)
        `not code`
        1. not a list
        * not a list
        # not a heading
        [foo]: /url &quot;not a reference&quot;
        &amp;ouml; not a character entity</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample311() throws {
        let markdown = #######"""
        \\*emphasis*

        """#######

        let expected = #######"""
        <p>\<em>emphasis</em></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample312() throws {
        let markdown = #######"""
        foo\
        bar

        """#######

        let expected = #######"""
        <p>foo<br />
        bar</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample313() throws {
        let markdown = #######"""
        `` \[\` ``

        """#######

        let expected = #######"""
        <p><code>\[\`</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample314() throws {
        let markdown = #######"""
            \[\]

        """#######

        let expected = #######"""
        <pre><code>\[\]
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample315() throws {
        let markdown = #######"""
        ~~~
        \[\]
        ~~~

        """#######

        let expected = #######"""
        <pre><code>\[\]
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample316() throws {
        let markdown = #######"""
        <http://example.com?find=\*>

        """#######

        let expected = #######"""
        <p><a href="http://example.com?find=%5C*">http://example.com?find=\*</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample317() throws {
        let markdown = #######"""
        <a href="/bar\/)">

        """#######

        let expected = #######"""
        <a href="/bar\/)">

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample318() throws {
        let markdown = #######"""
        [foo](/bar\* "ti\*tle")

        """#######

        let expected = #######"""
        <p><a href="/bar*" title="ti*tle">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample319() throws {
        let markdown = #######"""
        [foo]
        
        [foo]: /bar\* "ti\*tle"

        """#######

        let expected = #######"""
        <p><a href="/bar*" title="ti*tle">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample320() throws {
        let markdown = #######"""
        ``` foo\+bar
        foo
        ```

        """#######

        let expected = #######"""
        <pre><code class="language-foo+bar">foo
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
