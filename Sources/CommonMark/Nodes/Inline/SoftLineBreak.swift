import cmark_gfm

/**
 A soft line break.

 From the [CommonMark Spec](https://spec.commonmark.org/0.29):

 > ## [6.10 Soft line breaks](https://spec.commonmark.org/0.29/#soft-line-breaks)
 >
 > A regular line break (not in a code span or HTML tag)
 > that is not preceded by two or more spaces or a backslash
 > is parsed as a softbreak.
 > (A softbreak may be rendered in HTML
 > either as a line ending or as a space.
 > The result will be the same in browsers.)
*/
public final class SoftLineBreak: Node {
    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_SOFTBREAK }

    public convenience init() {
        self.init(new: ())
    }
}
