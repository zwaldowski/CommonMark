import cmark_gfm

/**
 An HTML block.

 From the [CommonMark Spec](https://spec.commonmark.org/0.29):

 > ## [4.6 HTML blocks](https://spec.commonmark.org/0.29/#html-blocks)
 >
 > An HTML block is a group of lines that is treated as raw HTML
 > (and will not be escaped in HTML output).
 */
public final class HTMLBlock: Block, Literal, InlineContainer {
    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_HTML_BLOCK }

    public convenience init() {
        self.init(newWithExtension: nil)
    }

    public convenience init(literal: String, children: [Inline]) {
        self.init()
        self.literal = literal
        self.children.append(contentsOf: children)
    }
}
