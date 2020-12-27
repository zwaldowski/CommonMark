// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecImagesTests: XCTestCase {
    func testExample580() throws {
        let markdown = #######"""
        ![foo](/url "title")

        """#######

        let expected = #######"""
        <p><img src="/url" alt="foo" title="title" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample581() throws {
        let markdown = #######"""
        ![foo *bar*]
        
        [foo *bar*]: train.jpg "train & tracks"

        """#######

        let expected = #######"""
        <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample582() throws {
        let markdown = #######"""
        ![foo ![bar](/url)](/url2)

        """#######

        let expected = #######"""
        <p><img src="/url2" alt="foo bar" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample583() throws {
        let markdown = #######"""
        ![foo [bar](/url)](/url2)

        """#######

        let expected = #######"""
        <p><img src="/url2" alt="foo bar" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample584() throws {
        let markdown = #######"""
        ![foo *bar*][]
        
        [foo *bar*]: train.jpg "train & tracks"

        """#######

        let expected = #######"""
        <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample585() throws {
        let markdown = #######"""
        ![foo *bar*][foobar]
        
        [FOOBAR]: train.jpg "train & tracks"

        """#######

        let expected = #######"""
        <p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample586() throws {
        let markdown = #######"""
        ![foo](train.jpg)

        """#######

        let expected = #######"""
        <p><img src="train.jpg" alt="foo" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample587() throws {
        let markdown = #######"""
        My ![foo bar](/path/to/train.jpg  "title"   )

        """#######

        let expected = #######"""
        <p>My <img src="/path/to/train.jpg" alt="foo bar" title="title" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample588() throws {
        let markdown = #######"""
        ![foo](<url>)

        """#######

        let expected = #######"""
        <p><img src="url" alt="foo" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample589() throws {
        let markdown = #######"""
        ![](/url)

        """#######

        let expected = #######"""
        <p><img src="/url" alt="" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample590() throws {
        let markdown = #######"""
        ![foo][bar]
        
        [bar]: /url

        """#######

        let expected = #######"""
        <p><img src="/url" alt="foo" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample591() throws {
        let markdown = #######"""
        ![foo][bar]
        
        [BAR]: /url

        """#######

        let expected = #######"""
        <p><img src="/url" alt="foo" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample592() throws {
        let markdown = #######"""
        ![foo][]
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p><img src="/url" alt="foo" title="title" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample593() throws {
        let markdown = #######"""
        ![*foo* bar][]
        
        [*foo* bar]: /url "title"

        """#######

        let expected = #######"""
        <p><img src="/url" alt="foo bar" title="title" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample594() throws {
        let markdown = #######"""
        ![Foo][]
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p><img src="/url" alt="Foo" title="title" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample595() throws {
        let markdown = #######"""
        ![foo] 
        []
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p><img src="/url" alt="foo" title="title" />
        []</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample596() throws {
        let markdown = #######"""
        ![foo]
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p><img src="/url" alt="foo" title="title" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample597() throws {
        let markdown = #######"""
        ![*foo* bar]
        
        [*foo* bar]: /url "title"

        """#######

        let expected = #######"""
        <p><img src="/url" alt="foo bar" title="title" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample598() throws {
        let markdown = #######"""
        ![[foo]]
        
        [[foo]]: /url "title"

        """#######

        let expected = #######"""
        <p>![[foo]]</p>
        <p>[[foo]]: /url &quot;title&quot;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample599() throws {
        let markdown = #######"""
        ![Foo]
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p><img src="/url" alt="Foo" title="title" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample600() throws {
        let markdown = #######"""
        !\[foo]
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p>![foo]</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample601() throws {
        let markdown = #######"""
        \![foo]
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p>!<a href="/url" title="title">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
