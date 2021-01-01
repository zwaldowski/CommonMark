/// An inline content element.
public class Inline: Node {}

// MARK: -

/// A node that contains inline elements.
public protocol InlineContainer: Container where Child == Inline {}

public extension InlineContainer where Self: Basic, Self: Inline {
    init(text string: String) {
        self.init(children: [ Text(literal: string) ])
    }
}
