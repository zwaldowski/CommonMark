// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecDisallowedRawHtmlExtensionTests: XCTestCase {
    func testExample653() throws {
        let markdown = #######"""
        <strong> <title> <style> <em>
        
        <blockquote>
          <xmp> is disallowed.  <XMP> is also disallowed.
        </blockquote>

        """#######

        let expected = #######"""
        <p><strong> &lt;title> &lt;style> <em></p>
        <blockquote>
          &lt;xmp> is disallowed.  &lt;XMP> is also disallowed.
        </blockquote>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: .unsafe)
        XCTAssertEqual(actual, expected)
    }

}
