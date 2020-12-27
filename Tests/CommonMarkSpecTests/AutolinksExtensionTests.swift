// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecAutolinksExtensionTests: XCTestCase {
    func testExample621() throws {
        let markdown = #######"""
        www.commonmark.org

        """#######

        let expected = #######"""
        <p><a href="http://www.commonmark.org">www.commonmark.org</a></p>

        """#######

        var options = Document.ParseOptions()
        options.automaticLinks = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample622() throws {
        let markdown = #######"""
        Visit www.commonmark.org/help for more information.

        """#######

        let expected = #######"""
        <p>Visit <a href="http://www.commonmark.org/help">www.commonmark.org/help</a> for more information.</p>

        """#######

        var options = Document.ParseOptions()
        options.automaticLinks = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample623() throws {
        let markdown = #######"""
        Visit www.commonmark.org.
        
        Visit www.commonmark.org/a.b.

        """#######

        let expected = #######"""
        <p>Visit <a href="http://www.commonmark.org">www.commonmark.org</a>.</p>
        <p>Visit <a href="http://www.commonmark.org/a.b">www.commonmark.org/a.b</a>.</p>

        """#######

        var options = Document.ParseOptions()
        options.automaticLinks = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample624() throws {
        let markdown = #######"""
        www.google.com/search?q=Markup+(business)
        
        (www.google.com/search?q=Markup+(business))

        """#######

        let expected = #######"""
        <p><a href="http://www.google.com/search?q=Markup+(business)">www.google.com/search?q=Markup+(business)</a></p>
        <p>(<a href="http://www.google.com/search?q=Markup+(business)">www.google.com/search?q=Markup+(business)</a>)</p>

        """#######

        var options = Document.ParseOptions()
        options.automaticLinks = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample625() throws {
        let markdown = #######"""
        www.google.com/search?q=(business))+ok

        """#######

        let expected = #######"""
        <p><a href="http://www.google.com/search?q=(business))+ok">www.google.com/search?q=(business))+ok</a></p>

        """#######

        var options = Document.ParseOptions()
        options.automaticLinks = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample626() throws {
        let markdown = #######"""
        www.google.com/search?q=commonmark&hl=en
        
        www.google.com/search?q=commonmark&hl;

        """#######

        let expected = #######"""
        <p><a href="http://www.google.com/search?q=commonmark&amp;hl=en">www.google.com/search?q=commonmark&amp;hl=en</a></p>
        <p><a href="http://www.google.com/search?q=commonmark">www.google.com/search?q=commonmark</a>&amp;hl;</p>

        """#######

        var options = Document.ParseOptions()
        options.automaticLinks = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample627() throws {
        let markdown = #######"""
        www.commonmark.org/he<lp

        """#######

        let expected = #######"""
        <p><a href="http://www.commonmark.org/he">www.commonmark.org/he</a>&lt;lp</p>

        """#######

        var options = Document.ParseOptions()
        options.automaticLinks = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample628() throws {
        let markdown = #######"""
        http://commonmark.org
        
        (Visit https://encrypted.google.com/search?q=Markup+(business))
        
        Anonymous FTP is available at ftp://foo.bar.baz.

        """#######

        let expected = #######"""
        <p><a href="http://commonmark.org">http://commonmark.org</a></p>
        <p>(Visit <a href="https://encrypted.google.com/search?q=Markup+(business)">https://encrypted.google.com/search?q=Markup+(business)</a>)</p>
        <p>Anonymous FTP is available at <a href="ftp://foo.bar.baz">ftp://foo.bar.baz</a>.</p>

        """#######

        var options = Document.ParseOptions()
        options.automaticLinks = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample629() throws {
        let markdown = #######"""
        foo@bar.baz

        """#######

        let expected = #######"""
        <p><a href="mailto:foo@bar.baz">foo@bar.baz</a></p>

        """#######

        var options = Document.ParseOptions()
        options.automaticLinks = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample630() throws {
        let markdown = #######"""
        hello@mail+xyz.example isn't valid, but hello+xyz@mail.example is.

        """#######

        let expected = #######"""
        <p>hello@mail+xyz.example isn't valid, but <a href="mailto:hello+xyz@mail.example">hello+xyz@mail.example</a> is.</p>

        """#######

        var options = Document.ParseOptions()
        options.automaticLinks = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample631() throws {
        let markdown = #######"""
        a.b-c_d@a.b
        
        a.b-c_d@a.b.
        
        a.b-c_d@a.b-
        
        a.b-c_d@a.b_

        """#######

        let expected = #######"""
        <p><a href="mailto:a.b-c_d@a.b">a.b-c_d@a.b</a></p>
        <p><a href="mailto:a.b-c_d@a.b">a.b-c_d@a.b</a>.</p>
        <p>a.b-c_d@a.b-</p>
        <p>a.b-c_d@a.b_</p>

        """#######

        var options = Document.ParseOptions()
        options.automaticLinks = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
