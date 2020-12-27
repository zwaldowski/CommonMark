// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecHardLineBreaksTests: XCTestCase {
    func testExample654() throws {
        let markdown = #######"""
        foo  
        baz

        """#######

        let expected = #######"""
        <p>foo<br />
        baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample655() throws {
        let markdown = #######"""
        foo\
        baz

        """#######

        let expected = #######"""
        <p>foo<br />
        baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample656() throws {
        let markdown = #######"""
        foo       
        baz

        """#######

        let expected = #######"""
        <p>foo<br />
        baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample657() throws {
        let markdown = #######"""
        foo  
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

    func testExample658() throws {
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

    func testExample659() throws {
        let markdown = #######"""
        *foo  
        bar*

        """#######

        let expected = #######"""
        <p><em>foo<br />
        bar</em></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample660() throws {
        let markdown = #######"""
        *foo\
        bar*

        """#######

        let expected = #######"""
        <p><em>foo<br />
        bar</em></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample661() throws {
        let markdown = #######"""
        `code 
        span`

        """#######

        let expected = #######"""
        <p><code>code  span</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample662() throws {
        let markdown = #######"""
        `code\
        span`

        """#######

        let expected = #######"""
        <p><code>code\ span</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample663() throws {
        let markdown = #######"""
        <a href="foo  
        bar">

        """#######

        let expected = #######"""
        <p><a href="foo  
        bar"></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample664() throws {
        let markdown = #######"""
        <a href="foo\
        bar">

        """#######

        let expected = #######"""
        <p><a href="foo\
        bar"></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample665() throws {
        let markdown = #######"""
        foo\

        """#######

        let expected = #######"""
        <p>foo\</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample666() throws {
        let markdown = #######"""
        foo  

        """#######

        let expected = #######"""
        <p>foo</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample667() throws {
        let markdown = #######"""
        ### foo\

        """#######

        let expected = #######"""
        <h3>foo\</h3>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample668() throws {
        let markdown = #######"""
        ### foo  

        """#######

        let expected = #######"""
        <h3>foo</h3>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
