import CommonMark

extension List {
    public convenience init(delimiter: Delimiter = .none, tight: Bool = true, @CommonMarkBuilder children: () -> [List.Item]) {
        self.init(delimiter: delimiter, children: children())
        self.tight = tight
    }

    public convenience init<Values>(of values: Values, delimiter: Delimiter = .none, tight: Bool = true, @CommonMarkBuilder _ builder: (Values.Element) -> [List.Item]) where Values: Sequence {
        self.init(delimiter: delimiter, children: values.flatMap { builder($0) })
        self.tight = tight
    }

    public convenience init<Values>(of values: Values, delimiter: Delimiter = .none, tight: Bool = true, @StringBuilder _ builder: (Values.Element) -> String) where Values: Sequence {
        self.init(delimiter: delimiter, children: values.map { List.Item(children: [Text(literal: builder($0))]) })
        self.tight = tight
    }
}

// MARK: -

extension List.Item {
    public convenience init(checked: Bool, @CommonMarkBuilder children: () -> [Block]) {
        self.init(checked: checked, children: children())
    }
}
