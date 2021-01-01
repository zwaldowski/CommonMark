import cmark_gfm

/// An element with literal contents.
public protocol Literal: Basic {
    init(literal: String)
}

// MARK: -

extension Literal {
    public init(literal: String) {
        self.init()
        self.literal = literal
    }

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
