import cmark_gfm

/// An element with literal contents.
public protocol Literal: Node {
    init(literal: String?)
}

// MARK: -

extension Literal {
    /// The literal contents of the element.
    public var literal: String? {
        get {
            return String(cString: cmark_node_get_literal(cmark_node))
        }
        
        set {
            cmark_node_set_literal(cmark_node, newValue)
        }
    }
}


// MARK: -

extension Code: Literal {}
extension CodeBlock: Literal {}
extension RawHTML: Literal {}
extension HTMLBlock: Literal {}
extension Text: Literal {}
