import cmark_gfm

/**
 A link.

 From the [CommonMark Spec](https://spec.commonmark.org/0.29):

 > ## [6.5 Links](https://spec.commonmark.org/0.29/#links)
 >
 > A link contains link text (the visible text),
 > a link destination (the URI that is the link destination),
 > and optionally a link title.

 > ## [4.7 Link reference definitions](https://spec.commonmark.org/0.29/#link-reference-definitions)

 > ## [6.7 Autolinks](https://spec.commonmark.org/0.29/#autolinks)
 */
public final class Link: Inline, Linked, InlineContainer {
    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_LINK }

    public convenience init<Children>(destination: String, title: String = "", children: Children) where Children: Sequence, Children.Element == Inline {
        self.init(newWithExtension: nil)
        self.destination = destination
        self.title = title
        self.children.append(contentsOf: children)
    }

    public convenience init(destination: String, title: String = "", text string: String) {
        self.init(destination: destination, title: title, children: [Text(literal: string)])
    }

    public override func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
        visitor.visit(link: self)
    }
}
