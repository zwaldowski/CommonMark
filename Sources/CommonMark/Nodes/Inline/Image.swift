import cmark_gfm

/**
 An image.

 From the [CommonMark Spec](https://spec.commonmark.org/0.29):

 > ## [6.6 Images](https://spec.commonmark.org/0.29/#images)
*/
public final class Image: Inline, Linked {
    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_IMAGE }

    public convenience init(urlString: String) {
        self.init(newWithExtension: nil)
        self.urlString = urlString
    }

    public override func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
        visitor.visit(image: self)
    }
}
