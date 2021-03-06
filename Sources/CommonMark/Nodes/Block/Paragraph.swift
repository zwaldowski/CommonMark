import cmark_gfm

/**
 A paragraph.
 
 From the [CommonMark Spec](https://spec.commonmark.org/0.29/#thematic-breaks):

 > ## [4.8 Paragraphs](https://spec.commonmark.org/0.29/#paragraphs)
 >
 > A sequence of non-blank lines
 > that cannot be interpreted as other kinds of blocks
 > forms a paragraph.
 > The contents of the paragraph are the result of
 > parsing the paragraph’s raw content as inlines.
 > The paragraph’s raw content is formed by
 > concatenating the lines and removing initial and final whitespace.
*/
public final class Paragraph: Block, Basic, InlineContainer {
    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_PARAGRAPH }

    public convenience init() {
        self.init(newWithExtension: nil)
    }

    public convenience init(text string: String, replacingNewLinesWithBreaks: Bool = true) {
        let children: [Inline]
        if replacingNewLinesWithBreaks {
            children = string.split(separator: "\n", omittingEmptySubsequences: false)
                             .flatMap { ($0.isEmpty ? [HardLineBreak()] : [Text(literal: "\($0)"), SoftLineBreak()]) }
        } else {
            children = [Text(literal: string)]
        }

        self.init(children: children)
    }

    public override func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
        visitor.visit(paragraph: self)
    }
}
