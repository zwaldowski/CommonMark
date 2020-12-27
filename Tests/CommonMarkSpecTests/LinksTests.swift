// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecLinksTests: XCTestCase {
    func testExample493() throws {
        let markdown = #######"""
        [link](/uri "title")

        """#######

        let expected = #######"""
        <p><a href="/uri" title="title">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample494() throws {
        let markdown = #######"""
        [link](/uri)

        """#######

        let expected = #######"""
        <p><a href="/uri">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample495() throws {
        let markdown = #######"""
        [link]()

        """#######

        let expected = #######"""
        <p><a href="">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample496() throws {
        let markdown = #######"""
        [link](<>)

        """#######

        let expected = #######"""
        <p><a href="">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample497() throws {
        let markdown = #######"""
        [link](/my uri)

        """#######

        let expected = #######"""
        <p>[link](/my uri)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample498() throws {
        let markdown = #######"""
        [link](</my uri>)

        """#######

        let expected = #######"""
        <p><a href="/my%20uri">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample499() throws {
        let markdown = #######"""
        [link](foo
        bar)

        """#######

        let expected = #######"""
        <p>[link](foo
        bar)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample500() throws {
        let markdown = #######"""
        [link](<foo
        bar>)

        """#######

        let expected = #######"""
        <p>[link](<foo
        bar>)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample501() throws {
        let markdown = #######"""
        [a](<b)c>)

        """#######

        let expected = #######"""
        <p><a href="b)c">a</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample502() throws {
        let markdown = #######"""
        [link](<foo\>)

        """#######

        let expected = #######"""
        <p>[link](&lt;foo&gt;)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample503() throws {
        let markdown = #######"""
        [a](<b)c
        [a](<b)c>
        [a](<b>c)

        """#######

        let expected = #######"""
        <p>[a](&lt;b)c
        [a](&lt;b)c&gt;
        [a](<b>c)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample504() throws {
        let markdown = #######"""
        [link](\(foo\))

        """#######

        let expected = #######"""
        <p><a href="(foo)">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample505() throws {
        let markdown = #######"""
        [link](foo(and(bar)))

        """#######

        let expected = #######"""
        <p><a href="foo(and(bar))">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample506() throws {
        let markdown = #######"""
        [link](foo\(and\(bar\))

        """#######

        let expected = #######"""
        <p><a href="foo(and(bar)">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample507() throws {
        let markdown = #######"""
        [link](<foo(and(bar)>)

        """#######

        let expected = #######"""
        <p><a href="foo(and(bar)">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample508() throws {
        let markdown = #######"""
        [link](foo\)\:)

        """#######

        let expected = #######"""
        <p><a href="foo):">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample509() throws {
        let markdown = #######"""
        [link](#fragment)
        
        [link](http://example.com#fragment)
        
        [link](http://example.com?foo=3#frag)

        """#######

        let expected = #######"""
        <p><a href="#fragment">link</a></p>
        <p><a href="http://example.com#fragment">link</a></p>
        <p><a href="http://example.com?foo=3#frag">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample510() throws {
        let markdown = #######"""
        [link](foo\bar)

        """#######

        let expected = #######"""
        <p><a href="foo%5Cbar">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample511() throws {
        let markdown = #######"""
        [link](foo%20b&auml;)

        """#######

        let expected = #######"""
        <p><a href="foo%20b%C3%A4">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample512() throws {
        let markdown = #######"""
        [link]("title")

        """#######

        let expected = #######"""
        <p><a href="%22title%22">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample513() throws {
        let markdown = #######"""
        [link](/url "title")
        [link](/url 'title')
        [link](/url (title))

        """#######

        let expected = #######"""
        <p><a href="/url" title="title">link</a>
        <a href="/url" title="title">link</a>
        <a href="/url" title="title">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample514() throws {
        let markdown = #######"""
        [link](/url "title \"&quot;")

        """#######

        let expected = #######"""
        <p><a href="/url" title="title &quot;&quot;">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample515() throws {
        let markdown = #######"""
        [link](/url "title")

        """#######

        let expected = #######"""
        <p><a href="/url%C2%A0%22title%22">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample516() throws {
        let markdown = #######"""
        [link](/url "title "and" title")

        """#######

        let expected = #######"""
        <p>[link](/url &quot;title &quot;and&quot; title&quot;)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample517() throws {
        let markdown = #######"""
        [link](/url 'title "and" title')

        """#######

        let expected = #######"""
        <p><a href="/url" title="title &quot;and&quot; title">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample518() throws {
        let markdown = #######"""
        [link](   /uri
          "title"  )

        """#######

        let expected = #######"""
        <p><a href="/uri" title="title">link</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample519() throws {
        let markdown = #######"""
        [link] (/uri)

        """#######

        let expected = #######"""
        <p>[link] (/uri)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample520() throws {
        let markdown = #######"""
        [link [foo [bar]]](/uri)

        """#######

        let expected = #######"""
        <p><a href="/uri">link [foo [bar]]</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample521() throws {
        let markdown = #######"""
        [link] bar](/uri)

        """#######

        let expected = #######"""
        <p>[link] bar](/uri)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample522() throws {
        let markdown = #######"""
        [link [bar](/uri)

        """#######

        let expected = #######"""
        <p>[link <a href="/uri">bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample523() throws {
        let markdown = #######"""
        [link \[bar](/uri)

        """#######

        let expected = #######"""
        <p><a href="/uri">link [bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample524() throws {
        let markdown = #######"""
        [link *foo **bar** `#`*](/uri)

        """#######

        let expected = #######"""
        <p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample525() throws {
        let markdown = #######"""
        [![moon](moon.jpg)](/uri)

        """#######

        let expected = #######"""
        <p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample526() throws {
        let markdown = #######"""
        [foo [bar](/uri)](/uri)

        """#######

        let expected = #######"""
        <p>[foo <a href="/uri">bar</a>](/uri)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample527() throws {
        let markdown = #######"""
        [foo *[bar [baz](/uri)](/uri)*](/uri)

        """#######

        let expected = #######"""
        <p>[foo <em>[bar <a href="/uri">baz</a>](/uri)</em>](/uri)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample528() throws {
        let markdown = #######"""
        ![[[foo](uri1)](uri2)](uri3)

        """#######

        let expected = #######"""
        <p><img src="uri3" alt="[foo](uri2)" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample529() throws {
        let markdown = #######"""
        *[foo*](/uri)

        """#######

        let expected = #######"""
        <p>*<a href="/uri">foo*</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample530() throws {
        let markdown = #######"""
        [foo *bar](baz*)

        """#######

        let expected = #######"""
        <p><a href="baz*">foo *bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample531() throws {
        let markdown = #######"""
        *foo [bar* baz]

        """#######

        let expected = #######"""
        <p><em>foo [bar</em> baz]</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample532() throws {
        let markdown = #######"""
        [foo <bar attr="](baz)">

        """#######

        let expected = #######"""
        <p>[foo <bar attr="](baz)"></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample533() throws {
        let markdown = #######"""
        [foo`](/uri)`

        """#######

        let expected = #######"""
        <p>[foo<code>](/uri)</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample534() throws {
        let markdown = #######"""
        [foo<http://example.com/?search=](uri)>

        """#######

        let expected = #######"""
        <p>[foo<a href="http://example.com/?search=%5D(uri)">http://example.com/?search=](uri)</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample535() throws {
        let markdown = #######"""
        [foo][bar]
        
        [bar]: /url "title"

        """#######

        let expected = #######"""
        <p><a href="/url" title="title">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample536() throws {
        let markdown = #######"""
        [link [foo [bar]]][ref]
        
        [ref]: /uri

        """#######

        let expected = #######"""
        <p><a href="/uri">link [foo [bar]]</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample537() throws {
        let markdown = #######"""
        [link \[bar][ref]
        
        [ref]: /uri

        """#######

        let expected = #######"""
        <p><a href="/uri">link [bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample538() throws {
        let markdown = #######"""
        [link *foo **bar** `#`*][ref]
        
        [ref]: /uri

        """#######

        let expected = #######"""
        <p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample539() throws {
        let markdown = #######"""
        [![moon](moon.jpg)][ref]
        
        [ref]: /uri

        """#######

        let expected = #######"""
        <p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample540() throws {
        let markdown = #######"""
        [foo [bar](/uri)][ref]
        
        [ref]: /uri

        """#######

        let expected = #######"""
        <p>[foo <a href="/uri">bar</a>]<a href="/uri">ref</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample541() throws {
        let markdown = #######"""
        [foo *bar [baz][ref]*][ref]
        
        [ref]: /uri

        """#######

        let expected = #######"""
        <p>[foo <em>bar <a href="/uri">baz</a></em>]<a href="/uri">ref</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample542() throws {
        let markdown = #######"""
        *[foo*][ref]
        
        [ref]: /uri

        """#######

        let expected = #######"""
        <p>*<a href="/uri">foo*</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample543() throws {
        let markdown = #######"""
        [foo *bar][ref]
        
        [ref]: /uri

        """#######

        let expected = #######"""
        <p><a href="/uri">foo *bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample544() throws {
        let markdown = #######"""
        [foo <bar attr="][ref]">
        
        [ref]: /uri

        """#######

        let expected = #######"""
        <p>[foo <bar attr="][ref]"></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample545() throws {
        let markdown = #######"""
        [foo`][ref]`
        
        [ref]: /uri

        """#######

        let expected = #######"""
        <p>[foo<code>][ref]</code></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample546() throws {
        let markdown = #######"""
        [foo<http://example.com/?search=][ref]>
        
        [ref]: /uri

        """#######

        let expected = #######"""
        <p>[foo<a href="http://example.com/?search=%5D%5Bref%5D">http://example.com/?search=][ref]</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample547() throws {
        let markdown = #######"""
        [foo][BaR]
        
        [bar]: /url "title"

        """#######

        let expected = #######"""
        <p><a href="/url" title="title">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample548() throws {
        let markdown = #######"""
        [Толпой][Толпой] is a Russian word.
        
        [ТОЛПОЙ]: /url

        """#######

        let expected = #######"""
        <p><a href="/url">Толпой</a> is a Russian word.</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample549() throws {
        let markdown = #######"""
        [Foo
          bar]: /url
        
        [Baz][Foo bar]

        """#######

        let expected = #######"""
        <p><a href="/url">Baz</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample550() throws {
        let markdown = #######"""
        [foo] [bar]
        
        [bar]: /url "title"

        """#######

        let expected = #######"""
        <p>[foo] <a href="/url" title="title">bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample551() throws {
        let markdown = #######"""
        [foo]
        [bar]
        
        [bar]: /url "title"

        """#######

        let expected = #######"""
        <p>[foo]
        <a href="/url" title="title">bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample552() throws {
        let markdown = #######"""
        [foo]: /url1
        
        [foo]: /url2
        
        [bar][foo]

        """#######

        let expected = #######"""
        <p><a href="/url1">bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample553() throws {
        let markdown = #######"""
        [bar][foo\!]
        
        [foo!]: /url

        """#######

        let expected = #######"""
        <p>[bar][foo!]</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample554() throws {
        let markdown = #######"""
        [foo][ref[]
        
        [ref[]: /uri

        """#######

        let expected = #######"""
        <p>[foo][ref[]</p>
        <p>[ref[]: /uri</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample555() throws {
        let markdown = #######"""
        [foo][ref[bar]]
        
        [ref[bar]]: /uri

        """#######

        let expected = #######"""
        <p>[foo][ref[bar]]</p>
        <p>[ref[bar]]: /uri</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample556() throws {
        let markdown = #######"""
        [[[foo]]]
        
        [[[foo]]]: /url

        """#######

        let expected = #######"""
        <p>[[[foo]]]</p>
        <p>[[[foo]]]: /url</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample557() throws {
        let markdown = #######"""
        [foo][ref\[]
        
        [ref\[]: /uri

        """#######

        let expected = #######"""
        <p><a href="/uri">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample558() throws {
        let markdown = #######"""
        [bar\\]: /uri
        
        [bar\\]

        """#######

        let expected = #######"""
        <p><a href="/uri">bar\</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample559() throws {
        let markdown = #######"""
        []
        
        []: /uri

        """#######

        let expected = #######"""
        <p>[]</p>
        <p>[]: /uri</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample560() throws {
        let markdown = #######"""
        [
         ]
        
        [
         ]: /uri

        """#######

        let expected = #######"""
        <p>[
        ]</p>
        <p>[
        ]: /uri</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample561() throws {
        let markdown = #######"""
        [foo][]
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p><a href="/url" title="title">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample562() throws {
        let markdown = #######"""
        [*foo* bar][]
        
        [*foo* bar]: /url "title"

        """#######

        let expected = #######"""
        <p><a href="/url" title="title"><em>foo</em> bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample563() throws {
        let markdown = #######"""
        [Foo][]
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p><a href="/url" title="title">Foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample564() throws {
        let markdown = #######"""
        [foo] 
        []
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p><a href="/url" title="title">foo</a>
        []</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample565() throws {
        let markdown = #######"""
        [foo]
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p><a href="/url" title="title">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample566() throws {
        let markdown = #######"""
        [*foo* bar]
        
        [*foo* bar]: /url "title"

        """#######

        let expected = #######"""
        <p><a href="/url" title="title"><em>foo</em> bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample567() throws {
        let markdown = #######"""
        [[*foo* bar]]
        
        [*foo* bar]: /url "title"

        """#######

        let expected = #######"""
        <p>[<a href="/url" title="title"><em>foo</em> bar</a>]</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample568() throws {
        let markdown = #######"""
        [[bar [foo]
        
        [foo]: /url

        """#######

        let expected = #######"""
        <p>[[bar <a href="/url">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample569() throws {
        let markdown = #######"""
        [Foo]
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p><a href="/url" title="title">Foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample570() throws {
        let markdown = #######"""
        [foo] bar
        
        [foo]: /url

        """#######

        let expected = #######"""
        <p><a href="/url">foo</a> bar</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample571() throws {
        let markdown = #######"""
        \[foo]
        
        [foo]: /url "title"

        """#######

        let expected = #######"""
        <p>[foo]</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample572() throws {
        let markdown = #######"""
        [foo*]: /url
        
        *[foo*]

        """#######

        let expected = #######"""
        <p>*<a href="/url">foo*</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample573() throws {
        let markdown = #######"""
        [foo][bar]
        
        [foo]: /url1
        [bar]: /url2

        """#######

        let expected = #######"""
        <p><a href="/url2">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample574() throws {
        let markdown = #######"""
        [foo][]
        
        [foo]: /url1

        """#######

        let expected = #######"""
        <p><a href="/url1">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample575() throws {
        let markdown = #######"""
        [foo]()
        
        [foo]: /url1

        """#######

        let expected = #######"""
        <p><a href="">foo</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample576() throws {
        let markdown = #######"""
        [foo](not a link)
        
        [foo]: /url1

        """#######

        let expected = #######"""
        <p><a href="/url1">foo</a>(not a link)</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample577() throws {
        let markdown = #######"""
        [foo][bar][baz]
        
        [baz]: /url

        """#######

        let expected = #######"""
        <p>[foo]<a href="/url">bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample578() throws {
        let markdown = #######"""
        [foo][bar][baz]
        
        [baz]: /url1
        [bar]: /url2

        """#######

        let expected = #######"""
        <p><a href="/url2">foo</a><a href="/url1">baz</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample579() throws {
        let markdown = #######"""
        [foo][bar][baz]
        
        [baz]: /url1
        [foo]: /url2

        """#######

        let expected = #######"""
        <p>[foo]<a href="/url1">bar</a></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
