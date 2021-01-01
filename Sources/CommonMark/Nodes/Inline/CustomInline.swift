import cmark_gfm

/// An inline element with unspecified data.
public class CustomInline: Inline {
    override class var cmark_node_type: cmark_node_type { CMARK_NODE_CUSTOM_INLINE }
    override class func isCompatible(with type: cmark_node_type) -> Bool {
        self == CustomInline.self ? CMARK_NODE_TYPE_INLINE_P(type) : super.isCompatible(with: type)
    }
}
