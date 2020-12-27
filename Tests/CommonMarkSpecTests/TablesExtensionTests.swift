// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecTablesExtensionTests: XCTestCase {
    func testExample198() throws {
        let markdown = #######"""
        | foo | bar |
        | --- | --- |
        | baz | bim |

        """#######

        let expected = #######"""
        <table>
        <thead>
        <tr>
        <th>foo</th>
        <th>bar</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>baz</td>
        <td>bim</td>
        </tr>
        </tbody>
        </table>

        """#######

        var options = Document.ParseOptions()
        options.tables = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample199() throws {
        let markdown = #######"""
        | abc | defghi |
        :-: | -----------:
        bar | baz

        """#######

        let expected = #######"""
        <table>
        <thead>
        <tr>
        <th align="center">abc</th>
        <th align="right">defghi</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td align="center">bar</td>
        <td align="right">baz</td>
        </tr>
        </tbody>
        </table>

        """#######

        var options = Document.ParseOptions()
        options.tables = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample200() throws {
        let markdown = #######"""
        | f\|oo  |
        | ------ |
        | b `\|` az |
        | b **\|** im |

        """#######

        let expected = #######"""
        <table>
        <thead>
        <tr>
        <th>f|oo</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>b <code>|</code> az</td>
        </tr>
        <tr>
        <td>b <strong>|</strong> im</td>
        </tr>
        </tbody>
        </table>

        """#######

        var options = Document.ParseOptions()
        options.tables = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample201() throws {
        let markdown = #######"""
        | abc | def |
        | --- | --- |
        | bar | baz |
        > bar

        """#######

        let expected = #######"""
        <table>
        <thead>
        <tr>
        <th>abc</th>
        <th>def</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>bar</td>
        <td>baz</td>
        </tr>
        </tbody>
        </table>
        <blockquote>
        <p>bar</p>
        </blockquote>

        """#######

        var options = Document.ParseOptions()
        options.tables = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample202() throws {
        let markdown = #######"""
        | abc | def |
        | --- | --- |
        | bar | baz |
        bar
        
        bar

        """#######

        let expected = #######"""
        <table>
        <thead>
        <tr>
        <th>abc</th>
        <th>def</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>bar</td>
        <td>baz</td>
        </tr>
        <tr>
        <td>bar</td>
        <td></td>
        </tr>
        </tbody>
        </table>
        <p>bar</p>

        """#######

        var options = Document.ParseOptions()
        options.tables = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample203() throws {
        let markdown = #######"""
        | abc | def |
        | --- |
        | bar |

        """#######

        let expected = #######"""
        <p>| abc | def |
        | --- |
        | bar |</p>

        """#######

        var options = Document.ParseOptions()
        options.tables = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample204() throws {
        let markdown = #######"""
        | abc | def |
        | --- | --- |
        | bar |
        | bar | baz | boo |

        """#######

        let expected = #######"""
        <table>
        <thead>
        <tr>
        <th>abc</th>
        <th>def</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>bar</td>
        <td></td>
        </tr>
        <tr>
        <td>bar</td>
        <td>baz</td>
        </tr>
        </tbody>
        </table>

        """#######

        var options = Document.ParseOptions()
        options.tables = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample205() throws {
        let markdown = #######"""
        | abc | def |
        | --- | --- |

        """#######

        let expected = #######"""
        <table>
        <thead>
        <tr>
        <th>abc</th>
        <th>def</th>
        </tr>
        </thead>
        </table>

        """#######

        var options = Document.ParseOptions()
        options.tables = true
        let document = try Document(markdown, options: options)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
