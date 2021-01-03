/// A content element without any required data.
public protocol Basic: Node {
    /// Creates an element with its default content.
    init()
}

public extension Basic where Self: Container {
    init<Children>(children: Children) where Children: Sequence, Children.Element == Child {
        self.init()
        self.children.append(contentsOf: children)
    }
}
