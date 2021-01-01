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
public final class Link: Inline, InlineContainer {
    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_LINK }
    
    public convenience init(urlString: String, title: String? = nil, text string: String) {
        self.init(urlString: urlString, title: title, children: [Text(literal: string)])
    }

    public convenience init(urlString: String?, title: String?, children: [Inline] = []) {
        self.init(newWithExtension: nil)
        self.urlString = urlString
        self.title = title
        self.children.append(contentsOf: children)
    }
}
