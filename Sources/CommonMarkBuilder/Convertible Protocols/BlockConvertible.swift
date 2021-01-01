import CommonMark

public protocol BlockConvertible {
    var blockValue: [Block] { get }
}

// MARK: Conformances

extension Block: BlockConvertible {
    public var blockValue: [Block] {
        return [self]
    }
}

extension String: BlockConvertible {
    public var blockValue: [Block] {
        [Paragraph(text: self)]
    }
}
