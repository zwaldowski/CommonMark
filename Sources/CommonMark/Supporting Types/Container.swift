import cmark_gfm

/// A node that contains other nodes.
public protocol Container: Node {
    associatedtype Child: Node = Node

    /// The block's children.
    var children: Children<Child> { get }
}

public extension Container {
    var children: Children<Child> {
        get { Children(parent: self) }
        set {}
    }
}
