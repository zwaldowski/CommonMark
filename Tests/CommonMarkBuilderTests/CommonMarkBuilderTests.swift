import XCTest
import CommonMark
import CommonMarkBuilder

final class CommonMarkBuilderTests: XCTestCase {
    func testCommonMarkBuilder() throws {
        let document = Document {
            Heading {
                Link(urlString: "https://www.un.org/en/universal-declaration-human-rights/",
                     title: "View full version") {
                    "Universal Declaration of Human Rights"
                }
            }

            Section {
                Heading { "Article 1." }
            }

            Document {
                """
                All human beings are born free and equal in dignity and rights.
                They are endowed with reason and conscience
                and should act towards one another in a spirit of brotherhood.
                """
            }
        }

        let expected = try Document(Fixtures.udhr)

        XCTAssertEqual(document.description, expected.description)
    }
}
