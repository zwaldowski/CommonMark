import cmark_gfm_extensions

/**
 A strikethrough span.

 From the [GitHub-Flavored Markdown Spec](https://github.github.com/gfm):

 > ## [6.5Strikethrough (extension)](https://github.github.com/gfm/#strikethrough-extension-)
*/
public final class Strikethrough: Inline, Basic, InlineContainer {
    override class var cmark_node_type: cmark_node_type { CMARK_NODE_STRIKETHROUGH }
    override class var cmark_syntax_extension: UnsafeMutablePointer<cmark_syntax_extension>? { SyntaxExtension.strikethrough.cmark_syntax_extension }

    public convenience init() {
        self.init(newWithExtension: nil)
    }

    public override func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
        visitor.visit(strikethrough: self)
    }
}
