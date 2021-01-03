import cmark_gfm

/// An element with literal contents.
public protocol Literal: Node {
    init(literal: String)
}

public extension Literal {
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

public extension Literal where Self: Container {
    init<Children>(literal: String, children: Children) where Children: Sequence, Children.Element == Child {
        self.init(literal: literal)
        self.children.append(contentsOf: children)
    }
}
