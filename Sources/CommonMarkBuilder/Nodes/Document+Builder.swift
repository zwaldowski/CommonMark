import CommonMark

extension Document {
    public convenience init(@CommonMarkBuilder content: () -> [Block]) {
        self.init(children: content())
    }
}
