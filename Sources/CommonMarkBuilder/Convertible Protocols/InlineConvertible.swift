import CommonMark

public protocol InlineConvertible {
    var inlineValue: [Inline] { get }
}

// MARK: Conformances

extension Inline: InlineConvertible {
    public var inlineValue: [Inline] {
        return [self]
    }
}

extension Paragraph: InlineConvertible {
    public var inlineValue: [Inline] {
        return Array(children)
    }
}

extension String: InlineConvertible {
    public var inlineValue: [Inline] {
        return [Text(literal: self)]
    }
}
