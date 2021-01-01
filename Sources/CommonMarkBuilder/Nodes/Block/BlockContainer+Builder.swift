import CommonMark

public extension BlockContainer where Self: Basic {
    init(@CommonMarkBuilder children: () -> [Block]) {
        self.init(children: children())
    }
}
