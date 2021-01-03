import cmark_gfm

/**
 An image.

 From the [CommonMark Spec](https://spec.commonmark.org/0.29):

 > ## [6.6 Images](https://spec.commonmark.org/0.29/#images)
*/
public final class Image: Inline {
    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_IMAGE }

    public convenience init(urlString: String, title: String? = nil) {
        self.init(newWithExtension: nil)
        self.urlString = urlString
        self.title = title
    }

    public override func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
        visitor.visit(image: self)
    }
}
