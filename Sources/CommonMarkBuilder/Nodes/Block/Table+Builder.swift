import CommonMark

public extension Table {
    convenience init(columnAlignments: [ColumnAlignment?] = [], @CommonMarkBuilder children: () -> [Table.Row]) {
        self.init(columnAlignments: columnAlignments, children: children())
    }
}
