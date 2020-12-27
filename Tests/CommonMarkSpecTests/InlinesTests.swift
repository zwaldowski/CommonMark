// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecInlinesTests: XCTestCase {
    func testExample307() throws {
        let markdown = #######"""
        `hi`lo`

        """#######

        let expected = #######"""
        <p><code>hi</code>lo`</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
