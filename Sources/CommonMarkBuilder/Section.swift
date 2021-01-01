import CommonMark

public struct Section {
    public var children: [Block] = []

    init(children: [Block]) {
        self.children = children
    }

    public init(levelAdjustment: Int = +1, @CommonMarkBuilder content: () -> [Block]) {
        self.init(children: content().map { child in
            guard let heading = child as? Heading else { return child }
            heading.level += levelAdjustment
            return heading
        })
    }
}
