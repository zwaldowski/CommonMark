// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecBlankLinesTests: XCTestCase {
    func testExample197() throws {
        let markdown = #######"""
          
        
        aaa
          
        
        # aaa
        
          

        """#######

        let expected = #######"""
        <p>aaa</p>
        <h1>aaa</h1>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
