// This file was automatically generated and should not be edited.

import XCTest
import CommonMark

final class CommonMarkSpecHtmlBlocksTests: XCTestCase {
    func testExample118() throws {
        let markdown = #######"""
        <table><tr><td>
        <pre>
        **Hello**,
        
        _world_.
        </pre>
        </td></tr></table>

        """#######

        let expected = #######"""
        <table><tr><td>
        <pre>
        **Hello**,
        <p><em>world</em>.
        </pre></p>
        </td></tr></table>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample119() throws {
        let markdown = #######"""
        <table>
          <tr>
            <td>
                   hi
            </td>
          </tr>
        </table>
        
        okay.

        """#######

        let expected = #######"""
        <table>
          <tr>
            <td>
                   hi
            </td>
          </tr>
        </table>
        <p>okay.</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample120() throws {
        let markdown = #######"""
         <div>
          *hello*
                 <foo><a>

        """#######

        let expected = #######"""
         <div>
          *hello*
                 <foo><a>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample121() throws {
        let markdown = #######"""
        </div>
        *foo*

        """#######

        let expected = #######"""
        </div>
        *foo*

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample122() throws {
        let markdown = #######"""
        <DIV CLASS="foo">
        
        *Markdown*
        
        </DIV>

        """#######

        let expected = #######"""
        <DIV CLASS="foo">
        <p><em>Markdown</em></p>
        </DIV>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample123() throws {
        let markdown = #######"""
        <div id="foo"
          class="bar">
        </div>

        """#######

        let expected = #######"""
        <div id="foo"
          class="bar">
        </div>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample124() throws {
        let markdown = #######"""
        <div id="foo" class="bar
          baz">
        </div>

        """#######

        let expected = #######"""
        <div id="foo" class="bar
          baz">
        </div>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample125() throws {
        let markdown = #######"""
        <div>
        *foo*
        
        *bar*

        """#######

        let expected = #######"""
        <div>
        *foo*
        <p><em>bar</em></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample126() throws {
        let markdown = #######"""
        <div id="foo"
        *hi*

        """#######

        let expected = #######"""
        <div id="foo"
        *hi*

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample127() throws {
        let markdown = #######"""
        <div class
        foo

        """#######

        let expected = #######"""
        <div class
        foo

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample128() throws {
        let markdown = #######"""
        <div *???-&&&-<---
        *foo*

        """#######

        let expected = #######"""
        <div *???-&&&-<---
        *foo*

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample129() throws {
        let markdown = #######"""
        <div><a href="bar">*foo*</a></div>

        """#######

        let expected = #######"""
        <div><a href="bar">*foo*</a></div>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample130() throws {
        let markdown = #######"""
        <table><tr><td>
        foo
        </td></tr></table>

        """#######

        let expected = #######"""
        <table><tr><td>
        foo
        </td></tr></table>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample131() throws {
        let markdown = #######"""
        <div></div>
        ``` c
        int x = 33;
        ```

        """#######

        let expected = #######"""
        <div></div>
        ``` c
        int x = 33;
        ```

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample132() throws {
        let markdown = #######"""
        <a href="foo">
        *bar*
        </a>

        """#######

        let expected = #######"""
        <a href="foo">
        *bar*
        </a>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample133() throws {
        let markdown = #######"""
        <Warning>
        *bar*
        </Warning>

        """#######

        let expected = #######"""
        <Warning>
        *bar*
        </Warning>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample134() throws {
        let markdown = #######"""
        <i class="foo">
        *bar*
        </i>

        """#######

        let expected = #######"""
        <i class="foo">
        *bar*
        </i>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample135() throws {
        let markdown = #######"""
        </ins>
        *bar*

        """#######

        let expected = #######"""
        </ins>
        *bar*

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample136() throws {
        let markdown = #######"""
        <del>
        *foo*
        </del>

        """#######

        let expected = #######"""
        <del>
        *foo*
        </del>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample137() throws {
        let markdown = #######"""
        <del>
        
        *foo*
        
        </del>

        """#######

        let expected = #######"""
        <del>
        <p><em>foo</em></p>
        </del>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample138() throws {
        let markdown = #######"""
        <del>*foo*</del>

        """#######

        let expected = #######"""
        <p><del><em>foo</em></del></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample139() throws {
        let markdown = #######"""
        <pre language="haskell"><code>
        import Text.HTML.TagSoup
        
        main :: IO ()
        main = print $ parseTags tags
        </code></pre>
        okay

        """#######

        let expected = #######"""
        <pre language="haskell"><code>
        import Text.HTML.TagSoup
        
        main :: IO ()
        main = print $ parseTags tags
        </code></pre>
        <p>okay</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample140() throws {
        let markdown = #######"""
        <script type="text/javascript">
        // JavaScript example
        
        document.getElementById("demo").innerHTML = "Hello JavaScript!";
        </script>
        okay

        """#######

        let expected = #######"""
        <script type="text/javascript">
        // JavaScript example
        
        document.getElementById("demo").innerHTML = "Hello JavaScript!";
        </script>
        <p>okay</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample141() throws {
        let markdown = #######"""
        <style
          type="text/css">
        h1 {color:red;}
        
        p {color:blue;}
        </style>
        okay

        """#######

        let expected = #######"""
        <style
          type="text/css">
        h1 {color:red;}
        
        p {color:blue;}
        </style>
        <p>okay</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample142() throws {
        let markdown = #######"""
        <style
          type="text/css">
        
        foo

        """#######

        let expected = #######"""
        <style
          type="text/css">
        
        foo

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample143() throws {
        let markdown = #######"""
        > <div>
        > foo
        
        bar

        """#######

        let expected = #######"""
        <blockquote>
        <div>
        foo
        </blockquote>
        <p>bar</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample144() throws {
        let markdown = #######"""
        - <div>
        - foo

        """#######

        let expected = #######"""
        <ul>
        <li>
        <div>
        </li>
        <li>foo</li>
        </ul>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample145() throws {
        let markdown = #######"""
        <style>p{color:red;}</style>
        *foo*

        """#######

        let expected = #######"""
        <style>p{color:red;}</style>
        <p><em>foo</em></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample146() throws {
        let markdown = #######"""
        <!-- foo -->*bar*
        *baz*

        """#######

        let expected = #######"""
        <!-- foo -->*bar*
        <p><em>baz</em></p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample147() throws {
        let markdown = #######"""
        <script>
        foo
        </script>1. *bar*

        """#######

        let expected = #######"""
        <script>
        foo
        </script>1. *bar*

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample148() throws {
        let markdown = #######"""
        <!-- Foo
        
        bar
           baz -->
        okay

        """#######

        let expected = #######"""
        <!-- Foo
        
        bar
           baz -->
        <p>okay</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample149() throws {
        let markdown = #######"""
        <?php
        
          echo '>';
        
        ?>
        okay

        """#######

        let expected = #######"""
        <?php
        
          echo '>';
        
        ?>
        <p>okay</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample150() throws {
        let markdown = #######"""
        <!DOCTYPE html>

        """#######

        let expected = #######"""
        <!DOCTYPE html>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample151() throws {
        let markdown = #######"""
        <![CDATA[
        function matchwo(a,b)
        {
          if (a < b && a < 0) then {
            return 1;
        
          } else {
        
            return 0;
          }
        }
        ]]>
        okay

        """#######

        let expected = #######"""
        <![CDATA[
        function matchwo(a,b)
        {
          if (a < b && a < 0) then {
            return 1;
        
          } else {
        
            return 0;
          }
        }
        ]]>
        <p>okay</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample152() throws {
        let markdown = #######"""
          <!-- foo -->
        
            <!-- foo -->

        """#######

        let expected = #######"""
          <!-- foo -->
        <pre><code>&lt;!-- foo --&gt;
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample153() throws {
        let markdown = #######"""
          <div>
        
            <div>

        """#######

        let expected = #######"""
          <div>
        <pre><code>&lt;div&gt;
        </code></pre>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample154() throws {
        let markdown = #######"""
        Foo
        <div>
        bar
        </div>

        """#######

        let expected = #######"""
        <p>Foo</p>
        <div>
        bar
        </div>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample155() throws {
        let markdown = #######"""
        <div>
        bar
        </div>
        *foo*

        """#######

        let expected = #######"""
        <div>
        bar
        </div>
        *foo*

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample156() throws {
        let markdown = #######"""
        Foo
        <a href="bar">
        baz

        """#######

        let expected = #######"""
        <p>Foo
        <a href="bar">
        baz</p>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample157() throws {
        let markdown = #######"""
        <div>
        
        *Emphasized* text.
        
        </div>

        """#######

        let expected = #######"""
        <div>
        <p><em>Emphasized</em> text.</p>
        </div>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample158() throws {
        let markdown = #######"""
        <div>
        *Emphasized* text.
        </div>

        """#######

        let expected = #######"""
        <div>
        *Emphasized* text.
        </div>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample159() throws {
        let markdown = #######"""
        <table>
        
        <tr>
        
        <td>
        Hi
        </td>
        
        </tr>
        
        </table>

        """#######

        let expected = #######"""
        <table>
        <tr>
        <td>
        Hi
        </td>
        </tr>
        </table>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

    func testExample160() throws {
        let markdown = #######"""
        <table>
        
          <tr>
        
            <td>
              Hi
            </td>
        
          </tr>
        
        </table>

        """#######

        let expected = #######"""
        <table>
          <tr>
        <pre><code>&lt;td&gt;
          Hi
        &lt;/td&gt;
        </code></pre>
          </tr>
        </table>

        """#######

        let document = try Document(markdown)
        let actual = document.render(format: .html, options: [ .unsafe, .unsafeTags ])
        XCTAssertEqual(actual, expected)
    }

}
