// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecRawHtmlTests: XCTestCase {
    func testExample632() throws {
        let markdown = #######"""
        <a><bab><c2c>

        """#######

        let expected = #######"""
        <p><a><bab><c2c></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample633() throws {
        let markdown = #######"""
        <a/><b2/>

        """#######

        let expected = #######"""
        <p><a/><b2/></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample634() throws {
        let markdown = #######"""
        <a  /><b2
        data="foo" >

        """#######

        let expected = #######"""
        <p><a  /><b2
        data="foo" ></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample635() throws {
        let markdown = #######"""
        <a foo="bar" bam = 'baz <em>"</em>'
        _boolean zoop:33=zoop:33 />

        """#######

        let expected = #######"""
        <p><a foo="bar" bam = 'baz <em>"</em>'
        _boolean zoop:33=zoop:33 /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample636() throws {
        let markdown = #######"""
        Foo <responsive-image src="foo.jpg" />

        """#######

        let expected = #######"""
        <p>Foo <responsive-image src="foo.jpg" /></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample637() throws {
        let markdown = #######"""
        <33> <__>

        """#######

        let expected = #######"""
        <p>&lt;33&gt; &lt;__&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample638() throws {
        let markdown = #######"""
        <a h*#ref="hi">

        """#######

        let expected = #######"""
        <p>&lt;a h*#ref=&quot;hi&quot;&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample639() throws {
        let markdown = #######"""
        <a href="hi'> <a href=hi'>

        """#######

        let expected = #######"""
        <p>&lt;a href=&quot;hi'&gt; &lt;a href=hi'&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample640() throws {
        let markdown = #######"""
        < a><
        foo><bar/ >
        <foo bar=baz
        bim!bop />

        """#######

        let expected = #######"""
        <p>&lt; a&gt;&lt;
        foo&gt;&lt;bar/ &gt;
        &lt;foo bar=baz
        bim!bop /&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample641() throws {
        let markdown = #######"""
        <a href='bar'title=title>

        """#######

        let expected = #######"""
        <p>&lt;a href='bar'title=title&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample642() throws {
        let markdown = #######"""
        </a></foo >

        """#######

        let expected = #######"""
        <p></a></foo ></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample643() throws {
        let markdown = #######"""
        </a href="foo">

        """#######

        let expected = #######"""
        <p>&lt;/a href=&quot;foo&quot;&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample644() throws {
        let markdown = #######"""
        foo <!-- this is a
        comment - with hyphen -->

        """#######

        let expected = #######"""
        <p>foo <!-- this is a
        comment - with hyphen --></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample645() throws {
        let markdown = #######"""
        foo <!-- not a comment -- two hyphens -->

        """#######

        let expected = #######"""
        <p>foo &lt;!-- not a comment -- two hyphens --&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample646() throws {
        let markdown = #######"""
        foo <!--> foo -->
        
        foo <!-- foo--->

        """#######

        let expected = #######"""
        <p>foo &lt;!--&gt; foo --&gt;</p>
        <p>foo &lt;!-- foo---&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample647() throws {
        let markdown = #######"""
        foo <?php echo $a; ?>

        """#######

        let expected = #######"""
        <p>foo <?php echo $a; ?></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample648() throws {
        let markdown = #######"""
        foo <!ELEMENT br EMPTY>

        """#######

        let expected = #######"""
        <p>foo <!ELEMENT br EMPTY></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample649() throws {
        let markdown = #######"""
        foo <![CDATA[>&<]]>

        """#######

        let expected = #######"""
        <p>foo <![CDATA[>&<]]></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample650() throws {
        let markdown = #######"""
        foo <a href="&ouml;">

        """#######

        let expected = #######"""
        <p>foo <a href="&ouml;"></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample651() throws {
        let markdown = #######"""
        foo <a href="\*">

        """#######

        let expected = #######"""
        <p>foo <a href="\*"></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample652() throws {
        let markdown = #######"""
        <a href="\"">

        """#######

        let expected = #######"""
        <p>&lt;a href=&quot;&quot;&quot;&gt;</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
