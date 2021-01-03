import CommonMark

extension Link {
    public convenience init(urlString: String, title: String = "", @CommonMarkBuilder children: () -> [Inline]) {
        self.init(urlString: urlString, title: title, children: children())
    }
}
