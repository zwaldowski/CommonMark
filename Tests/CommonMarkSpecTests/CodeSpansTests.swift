// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecCodeSpansTests: XCTestCase {
    func testExample338() throws {
        let markdown = #######"""
        `foo`

        """#######

        let expected = #######"""
        <p><code>foo</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample339() throws {
        let markdown = #######"""
        `` foo ` bar ``

        """#######

        let expected = #######"""
        <p><code>foo ` bar</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample340() throws {
        let markdown = #######"""
        ` `` `

        """#######

        let expected = #######"""
        <p><code>``</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample341() throws {
        let markdown = #######"""
        `  ``  `

        """#######

        let expected = #######"""
        <p><code> `` </code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample342() throws {
        let markdown = #######"""
        ` a`

        """#######

        let expected = #######"""
        <p><code> a</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample343() throws {
        let markdown = #######"""
        ` b `

        """#######

        let expected = #######"""
        <p><code> b </code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample344() throws {
        let markdown = #######"""
        ` `
        `  `

        """#######

        let expected = #######"""
        <p><code> </code>
        <code>  </code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample345() throws {
        let markdown = #######"""
        ``
        foo
        bar  
        baz
        ``

        """#######

        let expected = #######"""
        <p><code>foo bar   baz</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample346() throws {
        let markdown = #######"""
        ``
        foo 
        ``

        """#######

        let expected = #######"""
        <p><code>foo </code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample347() throws {
        let markdown = #######"""
        `foo   bar 
        baz`

        """#######

        let expected = #######"""
        <p><code>foo   bar  baz</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample348() throws {
        let markdown = #######"""
        `foo\`bar`

        """#######

        let expected = #######"""
        <p><code>foo\</code>bar`</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample349() throws {
        let markdown = #######"""
        ``foo`bar``

        """#######

        let expected = #######"""
        <p><code>foo`bar</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample350() throws {
        let markdown = #######"""
        ` foo `` bar `

        """#######

        let expected = #######"""
        <p><code>foo `` bar</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample351() throws {
        let markdown = #######"""
        *foo`*`

        """#######

        let expected = #######"""
        <p>*foo<code>*</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample352() throws {
        let markdown = #######"""
        [not a `link](/foo`)

        """#######

        let expected = #######"""
        <p>[not a <code>link](/foo</code>)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample353() throws {
        let markdown = #######"""
        `<a href="`">`

        """#######

        let expected = #######"""
        <p><code>&lt;a href=&quot;</code>&quot;&gt;`</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample354() throws {
        let markdown = #######"""
        <a href="`">`

        """#######

        let expected = #######"""
        <p><a href="`">`</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample355() throws {
        let markdown = #######"""
        `<http://foo.bar.`baz>`

        """#######

        let expected = #######"""
        <p><code>&lt;http://foo.bar.</code>baz&gt;`</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample356() throws {
        let markdown = #######"""
        <http://foo.bar.`baz>`

        """#######

        let expected = #######"""
        <p><a href="http://foo.bar.%60baz">http://foo.bar.`baz</a>`</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample357() throws {
        let markdown = #######"""
        ```foo``

        """#######

        let expected = #######"""
        <p>```foo``</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample358() throws {
        let markdown = #######"""
        `foo

        """#######

        let expected = #######"""
        <p>`foo</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample359() throws {
        let markdown = #######"""
        `foo``bar``

        """#######

        let expected = #######"""
        <p>`foo<code>bar</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
