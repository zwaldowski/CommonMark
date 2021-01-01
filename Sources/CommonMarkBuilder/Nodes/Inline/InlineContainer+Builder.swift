import CommonMark

public extension InlineContainer where Self: Basic {
    init(@CommonMarkBuilder children: () -> [Inline]) {
        self.init(children: children())
    }
}

public extension InlineContainer where Self: Basic, Self: Inline {
    init(@StringBuilder text: () -> String) {
        self.init(text: text())
    }
}
