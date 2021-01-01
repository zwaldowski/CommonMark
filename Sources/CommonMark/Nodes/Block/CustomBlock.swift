import cmark_gfm

/// A block element with unspecified data.
public class CustomBlock: Block {
    override class var cmark_node_type: cmark_node_type { CMARK_NODE_CUSTOM_BLOCK }
    override class func isCompatible(with type: cmark_node_type) -> Bool {
        self == CustomBlock.self ? CMARK_NODE_TYPE_BLOCK_P(type) : super.isCompatible(with: type)
    }
}
