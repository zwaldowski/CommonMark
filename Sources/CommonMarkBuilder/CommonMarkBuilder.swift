@_exported import CommonMark

@_functionBuilder
public struct CommonMarkBuilder {
    // MARK: buildExpression

    public static func buildExpression<Expression>(_ children: Expression) -> [Expression] where Expression: Node {
        return [children]
    }

    public static func buildExpression<Expression>(_ children: ForEach<Expression>) -> [Expression] where Expression: Node {
        return children.children
    }

    public static func buildExpression(_ document: Document) -> [Block] {
        return Array(document.children)
    }

    public static func buildExpression(_ children: Section) -> [Block] {
        return children.children
    }

    public static func buildExpression(_ children: String) -> [Block] {
        return [Paragraph(text: children)]
    }

    public static func buildExpression(_ children: String) -> [Inline] {
        return [Text(literal: children)]
    }

    // MARK: buildBlock

    public static func buildBlock<Component>(_ children: [Component]...) -> [Component] where Component: Node {
        return children.flatMap { $0 }
    }

    // MARK: buildIf

    public static func buildIf<Component>(_ children: [Component]?) -> [Component] where Component: Node {
        return children ?? []
    }

    // MARK: buildEither

    public static func buildEither<Component>(first children: [Component]) -> [Component] where Component: Node {
        return children
    }

    public static func buildEither<Component>(second children: [Component]) -> [Component] where Component: Node {
        return children
    }

    // MARK: -

    public static func buildArray<Component>(_ children: [Component]) -> [Component] where Component: Node {
        return children
    }
}
