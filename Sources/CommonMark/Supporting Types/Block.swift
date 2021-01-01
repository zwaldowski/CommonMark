import cmark_gfm

/// A block structure element.
public protocol Block {}

// MARK: -

/// A block that can contain other blocks.
public protocol ContainerBlock: Block {}

extension BlockQuote: ContainerBlock {}
extension List: ContainerBlock {}
extension List.Item: ContainerBlock {}

// MARK: -

/// A block that can only contain inline elements.
public protocol LeafBlock: Block {}

extension Heading: LeafBlock {}
extension Paragraph: LeafBlock {}
extension HTMLBlock: LeafBlock {}
extension CodeBlock: LeafBlock {}
extension ThematicBreak: LeafBlock {}

