import CommonMark

public struct Fragment {
    public var children: [Block] = []

    init(children: [Block]) {
        self.children = children
    }

    public init(@StringBuilder _ builder: () -> String) {
        let document = try? Document(builder())
        let children = document.map { Array($0.children) } ?? []
        self.init(children: children)
    }

    public init(@CommonMarkBuilder _ builder: () -> BlockConvertible) {
        self.init(children: builder().blockValue)
    }
}

// MARK: - BlockConvertible

extension Fragment: BlockConvertible {
    public var blockValue: [Block] {
        return children
    }
}

// MARK: - ListItemConvertible

extension Fragment: ListItemConvertible {
    public var listItemValue: [List.Item] {
        return children as? [List.Item] ?? [List.Item(children: children)]
    }
}
