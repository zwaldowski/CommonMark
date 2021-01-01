public struct ForEach<Content> where Content: Node {
    var children: [Content] = []

    public init<Data>(_ data: Data, @CommonMarkBuilder content: (Data.Element) -> Content) where Data: Sequence {
        self.children = data.map(content)
    }
}
