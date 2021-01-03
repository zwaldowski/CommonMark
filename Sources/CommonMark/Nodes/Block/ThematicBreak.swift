import cmark_gfm

/**
 A thematic break.

 From the [CommonMark Spec](https://spec.commonmark.org/0.29/):

 > ## [4.1 Thematic breaks](https://spec.commonmark.org/0.29/#thematic-breaks)
 >
 > A line consisting of 0-3 spaces of indentation,
 > followed by a sequence of three or more matching -, _, or * characters,
 > each followed optionally by any number of spaces or tabs,
 > forms a thematic break.
 */
public final class ThematicBreak: Block, Basic {
    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_THEMATIC_BREAK }

    public convenience init() {
        self.init(newWithExtension: nil)
    }

    public override func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
        visitor.visit(thematicBreak: self)
    }
}
