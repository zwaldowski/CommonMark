// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecAutolinksTests: XCTestCase {
    func testExample602() throws {
        let markdown = #######"""
        <http://foo.bar.baz>

        """#######

        let expected = #######"""
        <p><a href="http://foo.bar.baz">http://foo.bar.baz</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample603() throws {
        let markdown = #######"""
        <http://foo.bar.baz/test?q=hello&id=22&boolean>

        """#######

        let expected = #######"""
        <p><a href="http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean">http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample604() throws {
        let markdown = #######"""
        <irc://foo.bar:2233/baz>

        """#######

        let expected = #######"""
        <p><a href="irc://foo.bar:2233/baz">irc://foo.bar:2233/baz</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample605() throws {
        let markdown = #######"""
        <MAILTO:FOO@BAR.BAZ>

        """#######

        let expected = #######"""
        <p><a href="MAILTO:FOO@BAR.BAZ">MAILTO:FOO@BAR.BAZ</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample606() throws {
        let markdown = #######"""
        <a+b+c:d>

        """#######

        let expected = #######"""
        <p><a href="a+b+c:d">a+b+c:d</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample607() throws {
        let markdown = #######"""
        <made-up-scheme://foo,bar>

        """#######

        let expected = #######"""
        <p><a href="made-up-scheme://foo,bar">made-up-scheme://foo,bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample608() throws {
        let markdown = #######"""
        <http://../>

        """#######

        let expected = #######"""
        <p><a href="http://../">http://../</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample609() throws {
        let markdown = #######"""
        <localhost:5001/foo>

        """#######

        let expected = #######"""
        <p><a href="localhost:5001/foo">localhost:5001/foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample610() throws {
        let markdown = #######"""
        <http://foo.bar/baz bim>

        """#######

        let expected = #######"""
        <p>&lt;http://foo.bar/baz bim&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample611() throws {
        let markdown = #######"""
        <http://example.com/\[\>

        """#######

        let expected = #######"""
        <p><a href="http://example.com/%5C%5B%5C">http://example.com/\[\</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample612() throws {
        let markdown = #######"""
        <foo@bar.example.com>

        """#######

        let expected = #######"""
        <p><a href="mailto:foo@bar.example.com">foo@bar.example.com</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample613() throws {
        let markdown = #######"""
        <foo+special@Bar.baz-bar0.com>

        """#######

        let expected = #######"""
        <p><a href="mailto:foo+special@Bar.baz-bar0.com">foo+special@Bar.baz-bar0.com</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample614() throws {
        let markdown = #######"""
        <foo\+@bar.example.com>

        """#######

        let expected = #######"""
        <p>&lt;foo+@bar.example.com&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample615() throws {
        let markdown = #######"""
        <>

        """#######

        let expected = #######"""
        <p>&lt;&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample616() throws {
        let markdown = #######"""
        < http://foo.bar >

        """#######

        let expected = #######"""
        <p>&lt; http://foo.bar &gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample617() throws {
        let markdown = #######"""
        <m:abc>

        """#######

        let expected = #######"""
        <p>&lt;m:abc&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample618() throws {
        let markdown = #######"""
        <foo.bar.baz>

        """#######

        let expected = #######"""
        <p>&lt;foo.bar.baz&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample619() throws {
        let markdown = #######"""
        http://example.com

        """#######

        let expected = #######"""
        <p>http://example.com</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample620() throws {
        let markdown = #######"""
        foo@bar.example.com

        """#######

        let expected = #######"""
        <p>foo@bar.example.com</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
