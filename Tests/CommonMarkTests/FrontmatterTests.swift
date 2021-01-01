import XCTest
import CommonMark

class FrontmatterTests: XCTestCase {
    func testGetLiteral() throws {
        var options = Document.ParseOptions()
        options.frontmatter = true
        let document = try Document(Fixtures.frontmatter, options: options)
        let frontmatter = try XCTUnwrap(document.children.first as? Frontmatter)
        XCTAssertEqual(frontmatter.literal, """
        author: George P. Burdell
        description: A single-line description of the course.
        cover: shiny.jpg

        """)
    }

    func testPlainRendering() throws {
        var options = Document.ParseOptions()
        options.frontmatter = true
        let document = try Document(Fixtures.frontmatter, options: options)
        XCTAssertEqual(document.render(format: .plain), #"""
        Big Nerd Ranch Guides: The Big Nerd Ranch Guide

        """#)
    }

    func testCommonMarkRendering() throws {
        var options = Document.ParseOptions()
        options.frontmatter = true
        let document = try Document(Fixtures.frontmatter, options: options)
        XCTAssertEqual(document.render(format: .commonmark), #"""
        ---
        author: George P. Burdell
        description: A single-line description of the course.
        cover: shiny.jpg
        ---

        # Big Nerd Ranch Guides: The Big Nerd Ranch Guide

        """#)
    }

    func testHTMLRendering() throws {
        var options = Document.ParseOptions()
        options.frontmatter = true
        let document = try Document(Fixtures.frontmatter, options: options)
        XCTAssertEqual(document.render(format: .html), #"""
        <h1>Big Nerd Ranch Guides: The Big Nerd Ranch Guide</h1>

        """#)
    }

    func testXMLRendering() throws {
        var options = Document.ParseOptions()
        options.frontmatter = true
        let document = try Document(Fixtures.frontmatter, options: options)
        XCTAssertEqual(document.render(format: .xml), #"""
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE document SYSTEM "CommonMark.dtd">
        <document xmlns="http://commonmark.org/xml/1.0">
          <frontmatter xml:space="preserve">author: George P. Burdell
        description: A single-line description of the course.
        cover: shiny.jpg
        </frontmatter>
          <heading level="1">
            <text xml:space="preserve">Big Nerd Ranch Guides: The Big Nerd Ranch Guide</text>
          </heading>
        </document>

        """#)
    }
}

