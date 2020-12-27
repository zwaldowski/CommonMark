// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecEntityAndNumericCharacterReferencesTests: XCTestCase {
    func testExample321() throws {
        let markdown = #######"""
        &nbsp; &amp; &copy; &AElig; &Dcaron;
        &frac34; &HilbertSpace; &DifferentialD;
        &ClockwiseContourIntegral; &ngE;

        """#######

        let expected = #######"""
        <p>  &amp; © Æ Ď
        ¾ ℋ ⅆ
        ∲ ≧̸</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample322() throws {
        let markdown = #######"""
        &#35; &#1234; &#992; &#0;

        """#######

        let expected = #######"""
        <p># Ӓ Ϡ �</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample323() throws {
        let markdown = #######"""
        &#X22; &#XD06; &#xcab;

        """#######

        let expected = #######"""
        <p>&quot; ആ ಫ</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample324() throws {
        let markdown = #######"""
        &nbsp &x; &#; &#x;
        &#987654321;
        &#abcdef0;
        &ThisIsNotDefined; &hi?;

        """#######

        let expected = #######"""
        <p>&amp;nbsp &amp;x; &amp;#; &amp;#x;
        &amp;#987654321;
        &amp;#abcdef0;
        &amp;ThisIsNotDefined; &amp;hi?;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample325() throws {
        let markdown = #######"""
        &copy

        """#######

        let expected = #######"""
        <p>&amp;copy</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample326() throws {
        let markdown = #######"""
        &MadeUpEntity;

        """#######

        let expected = #######"""
        <p>&amp;MadeUpEntity;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample327() throws {
        let markdown = #######"""
        <a href="&ouml;&ouml;.html">

        """#######

        let expected = #######"""
        <a href="&ouml;&ouml;.html">

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample328() throws {
        let markdown = #######"""
        [foo](/f&ouml;&ouml; "f&ouml;&ouml;")

        """#######

        let expected = #######"""
        <p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample329() throws {
        let markdown = #######"""
        [foo]
        
        [foo]: /f&ouml;&ouml; "f&ouml;&ouml;"

        """#######

        let expected = #######"""
        <p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample330() throws {
        let markdown = #######"""
        ``` f&ouml;&ouml;
        foo
        ```

        """#######

        let expected = #######"""
        <pre><code class="language-föö">foo
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample331() throws {
        let markdown = #######"""
        `f&ouml;&ouml;`

        """#######

        let expected = #######"""
        <p><code>f&amp;ouml;&amp;ouml;</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample332() throws {
        let markdown = #######"""
            f&ouml;f&ouml;

        """#######

        let expected = #######"""
        <pre><code>f&amp;ouml;f&amp;ouml;
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample333() throws {
        let markdown = #######"""
        &#42;foo&#42;
        *foo*

        """#######

        let expected = #######"""
        <p>*foo*
        <em>foo</em></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample334() throws {
        let markdown = #######"""
        &#42; foo
        
        * foo

        """#######

        let expected = #######"""
        <p>* foo</p>
        <ul>
        <li>foo</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample335() throws {
        let markdown = #######"""
        foo&#10;&#10;bar

        """#######

        let expected = #######"""
        <p>foo
        
        bar</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample336() throws {
        let markdown = #######"""
        &#9;foo

        """#######

        let expected = #######"""
        <p>	foo</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample337() throws {
        let markdown = #######"""
        [a](url &quot;tit&quot;)

        """#######

        let expected = #######"""
        <p>[a](url &quot;tit&quot;)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
