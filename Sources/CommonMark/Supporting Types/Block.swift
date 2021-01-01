/// A block structure element.
open class Block: Node {}

// MARK: -

/// A node that contains block elements.
public protocol BlockContainer: Container where Child == Block {}

public extension BlockContainer where Self: Basic {
    init(children: [Inline]) {
        self.init(children: [ Paragraph(children: children) ])
    }
}
