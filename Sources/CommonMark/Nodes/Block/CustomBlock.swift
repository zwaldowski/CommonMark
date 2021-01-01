import cmark_gfm

/// A block element with unspecified data.
open class CustomBlock: Block, Container {
    override class var cmark_node_type: cmark_node_type { CMARK_NODE_CUSTOM_BLOCK }
    override class var cmark_syntax_extension: UnsafeMutablePointer<cmark_syntax_extension>? { SyntaxExtension.customNodes.cmark_syntax_extension }
    override class func isCompatible(with type: cmark_node_type) -> Bool {
        self == CustomBlock.self ? CMARK_NODE_TYPE_BLOCK_P(type) : super.isCompatible(with: type)
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

    open func renderMarkdownStart<Output>(to target: inout Output) where Output: MarkdownOutputStream {}
    open func renderMarkdownEnd<Output>(to target: inout Output) where Output: MarkdownOutputStream {}
    open var markdownPrefix: String? { nil }

    open func renderHTMLStart<Output>(to target: inout Output) where Output: MarkdownOutputStream {
        target.write("<div>")
    }

    open func renderHTMLEnd<Output>(to target: inout Output) where Output: MarkdownOutputStream {
        target.write("</div>")
    }

    open func renderLaTeXStart<Output>(to target: inout Output) where Output: MarkdownOutputStream {}
    open func renderLaTeXEnd<Output>(to target: inout Output) where Output: MarkdownOutputStream {}

    open func renderManpageStart<Output>(to target: inout Output) where Output: MarkdownOutputStream {}
    open func renderManpageEnd<Output>(to target: inout Output) where Output: MarkdownOutputStream {}
}
