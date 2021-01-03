import cmark_gfm_extensions

/**
 A frontmatter block.
 */
public final class Frontmatter: Block, Literal {
    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_CODE_BLOCK }
    override class var cmark_syntax_extension: UnsafeMutablePointer<cmark_syntax_extension>? { SyntaxExtension.frontmatter.cmark_syntax_extension }

    public convenience init() {
        self.init(newWithExtension: nil)
    }

    public override func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
        visitor.visit(frontmatter: self)
    }
}
