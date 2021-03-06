import cmark_gfm

/**
 Textual content.

 From the [CommonMark Spec](https://spec.commonmark.org/0.29):

 > ## [6.11 Textual content](https://spec.commonmark.org/0.29/#textual-content)
 >
 > Any characters not given an interpretation by the above rules
 > will be parsed as plain textual content.
*/
public final class Text: Inline, Literal {
    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_TEXT }

    public convenience init(literal: String) {
        self.init(newWithExtension: nil)
        self.literal = literal
    }

    public override func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
        visitor.visit(text: self)
    }
}
