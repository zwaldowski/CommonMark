import CommonMark

extension Link {
    public convenience init(destination: String, title: String = "", @CommonMarkBuilder children: () -> [Inline]) {
        self.init(destination: destination, title: title, children: children())
    }
}
