import CommonMark

public protocol ListItemConvertible {
    var listItemValue: [List.Item] { get }
}

// MARK: Conformances

extension Inline: ListItemConvertible {
    public var listItemValue: [List.Item] {
        return [List.Item(children: [self])]
    }
}

extension List.Item: ListItemConvertible {
    public var listItemValue: [List.Item] {
        return [self]
    }
}
