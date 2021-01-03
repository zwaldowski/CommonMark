import cmark_gfm

/// An inline element with unspecified data.
public class CustomInline: Inline, InlineContainer {
    override class var cmark_node_type: cmark_node_type { CMARK_NODE_CUSTOM_INLINE }
    override class var cmark_syntax_extension: UnsafeMutablePointer<cmark_syntax_extension>? { SyntaxExtension.customNodes.cmark_syntax_extension }
    override class func isCompatible(with type: cmark_node_type) -> Bool {
        self == CustomInline.self ? CMARK_NODE_TYPE_INLINE_P(type) : super.isCompatible(with: type)
    }

    override init(_ cmark_node: UnsafeMutablePointer<cmark_node>, owner: Node?) {
        super.init(cmark_node, owner: owner)
    }

    public init() {
        super.init(newWithExtension: nil)
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public override func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
        visitor.visit(customInline: self)
    }

    open func renderMarkdownStart<Output>(to target: inout Output) where Output: MarkdownOutputStream {}
    open func renderMarkdownEnd<Output>(to target: inout Output) where Output: MarkdownOutputStream {}

    open func renderHTMLStart<Output>(to target: inout Output) where Output: MarkdownOutputStream {
        target.write("<span>")
    }

    open func renderHTMLEnd<Output>(to target: inout Output) where Output: MarkdownOutputStream {
        target.write("</span>")
    }

    open func renderLaTeXStart<Output>(to target: inout Output) where Output: MarkdownOutputStream {}
    open func renderLaTeXEnd<Output>(to target: inout Output) where Output: MarkdownOutputStream {}

    open func renderManpageStart<Output>(to target: inout Output) where Output: MarkdownOutputStream {}
    open func renderManpageEnd<Output>(to target: inout Output) where Output: MarkdownOutputStream {}
}
