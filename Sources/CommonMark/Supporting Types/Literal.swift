import cmark_gfm

/// An element with literal contents.
public protocol Literal: Basic {
    init(literal: String)
}

// MARK: -

public extension Literal {
    init(literal: String) {
        self.init()
        self.literal = literal
    }

    /// The literal contents of the element.
    var literal: String {
        get {
            guard let cString = cmark_node_get_literal(cmark_node) else { return "" }
            return String(cString: cString)
        }
        
        set {
            cmark_node_set_literal(cmark_node, newValue)
        }
    }
}
