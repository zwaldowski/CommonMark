/// A type for traversing a hierarchy of CommonMark nodes.
///
/// A node "accepts" a visitor, which then traverses itself and each of its
/// children, thus "visiting" each node in the tree and producing some result
/// for that node.
///
/// A visitor that only needs information from part of the tree can implement only some of the `visit`
/// methods and build up internal state. In this case, the default `Result` type `Void` is used.
///
/// A visitor that transforms the entire tree — for instance, by converting it to anothe representation — may
/// provide a specific `Result` type and implement all of the `visit` methods.
public protocol Visitor {
    /// The result type returned when visiting a element.
    associatedtype Result = Void

    /// Visits the node and returns a result.
    mutating func visit(_ node: Node) -> Result

    /// Visits the `BlockQuote` and returns a result.
    mutating func visit(blockQuote: BlockQuote) -> Result

    /// Visits the `Code` and returns a result.
    mutating func visit(code: Code) -> Result

    /// Visits the `CodeBlock` and returns a result.
    mutating func visit(codeBlock: CodeBlock) -> Result

    /// Visits the `CustomBlock` and returns a result.
    mutating func visit(customBlock: CustomBlock) -> Result

    /// Visits the `CustomInline` and returns a result.
    mutating func visit(customInline: CustomInline) -> Result

    /// Visits the `Document` and returns a result.
    mutating func visit(document: Document) -> Result

    /// Visits the `Emphasis` and returns a result.
    mutating func visit(emphasis: Emphasis) -> Result

    /// Visits the `Frontmatter` and returns a result.
    mutating func visit(frontmatter: Frontmatter) -> Result

    /// Visits the `HardLineBreak` and returns a result.
    mutating func visit(hardLineBreak: HardLineBreak) -> Result

    /// Visits the `Heading` and returns a result.
    mutating func visit(heading: Heading) -> Result

    /// Visits the `HTMLBlock` and returns a result.
    mutating func visit(htmlBlock: HTMLBlock) -> Result

    /// Visits the `Image` and returns a result.
    mutating func visit(image: Image) -> Result

    /// Visits the `Link` and returns a result.
    mutating func visit(link: Link) -> Result

    /// Visits the `List` and returns a result.
    mutating func visit(list: List) -> Result

    /// Visits the `List.Item` and returns a result.
    mutating func visit(listItem: List.Item) -> Result

    /// Visits the `Paragraph` and returns a result.
    mutating func visit(paragraph: Paragraph) -> Result

    /// Visits the `RawHTML` and returns a result.
    mutating func visit(rawHTML: RawHTML) -> Result

    /// Visits the `SoftLineBreak` and returns a result.
    mutating func visit(softLineBreak: SoftLineBreak) -> Result

    /// Visits the `Strikethrough` and returns a result.
    mutating func visit(strikethrough: Strikethrough) -> Result

    /// Visits the `Strong` and returns a result.
    mutating func visit(strong: Strong) -> Result

    /// Visits the `Table` and returns a result.
    mutating func visit(table: Table) -> Result

    /// Visits the `Table.Cell` and returns a result.
    mutating func visit(tableCell: Table.Cell) -> Result

    /// Visits the `Table.Head` and returns a result.
    mutating func visit(tableHead: Table.Head) -> Result

    /// Visits the `Table.Row` and returns a result.
    mutating func visit(tableRow: Table.Row) -> Result

    /// Visits the `Text` and returns a result.
    mutating func visit(text: Text) -> Result

    /// Visits the `ThematicBreak` and returns a result.
    mutating func visit(thematicBreak: ThematicBreak) -> Result
}

public extension Visitor {
    mutating func visit(blockQuote: BlockQuote) -> Result {
        visit(blockQuote)
    }

    mutating func visit(code: Code) -> Result {
        visit(code)
    }

    mutating func visit(codeBlock: CodeBlock) -> Result {
        visit(codeBlock)
    }

    mutating func visit(customBlock: CustomBlock) -> Result {
        visit(customBlock)
    }

    mutating func visit(customInline: CustomInline) -> Result {
        visit(customInline)
    }

    mutating func visit(document: Document) -> Result {
        visit(document)
    }

    mutating func visit(emphasis: Emphasis) -> Result {
        visit(emphasis)
    }

    mutating func visit(frontmatter: Frontmatter) -> Result {
        visit(frontmatter)
    }

    mutating func visit(hardLineBreak: HardLineBreak) -> Result {
        visit(hardLineBreak)
    }

    mutating func visit(heading: Heading) -> Result {
        visit(heading)
    }

    mutating func visit(htmlBlock: HTMLBlock) -> Result {
        visit(htmlBlock)
    }

    mutating func visit(image: Image) -> Result {
        visit(image)
    }

    mutating func visit(link: Link) -> Result {
        visit(link)
    }

    mutating func visit(list: List) -> Result {
        visit(list)
    }

    mutating func visit(listItem: List.Item) -> Result {
        visit(listItem)
    }

    mutating func visit(paragraph: Paragraph) -> Result {
        visit(paragraph)
    }

    mutating func visit(rawHTML: RawHTML) -> Result {
        visit(rawHTML)
    }

    mutating func visit(softLineBreak: SoftLineBreak) -> Result {
        visit(softLineBreak)
    }

    mutating func visit(strikethrough: Strikethrough) -> Result {
        visit(strikethrough)
    }

    mutating func visit(strong: Strong) -> Result {
        visit(strong)
    }

    mutating func visit(table: Table) -> Result {
        visit(table)
    }

    mutating func visit(tableCell: Table.Cell) -> Result {
        visit(tableCell)
    }

    mutating func visit(tableHead: Table.Head) -> Result {
        visit(tableHead)
    }

    mutating func visit(tableRow: Table.Row) -> Result {
        visit(tableRow)
    }

    mutating func visit(text: Text) -> Result {
        visit(text)
    }

    mutating func visit(thematicBreak: ThematicBreak) -> Result {
        visit(thematicBreak)
    }
}

public extension Visitor where Result == Void {
    /// Visits each of the children of the `node`.
    mutating func descendInto<Node>(_ node: Node) where Node: Container {
        for child in node.children {
            child.accept(&self)
        }
    }

    mutating func visit(_ node: Node) {}

    mutating func visit(blockQuote: BlockQuote) {
        visit(blockQuote)
        descendInto(blockQuote)
    }

    mutating func visit(code: Code) {
        visit(code)
    }

    mutating func visit(codeBlock: CodeBlock) {
        visit(codeBlock)
        descendInto(codeBlock)
    }

    mutating func visit(customBlock: CustomBlock) {
        visit(customBlock)
        descendInto(customBlock)
    }

    mutating func visit(customInline: CustomInline) {
        visit(customInline)
        descendInto(customInline)
    }

    mutating func visit(document: Document) {
        visit(document)
        descendInto(document)
    }

    mutating func visit(emphasis: Emphasis) {
        visit(emphasis)
        descendInto(emphasis)
    }

    mutating func visit(frontmatter: Frontmatter) {
        visit(frontmatter)
    }

    mutating func visit(hardLineBreak: HardLineBreak) {
        visit(hardLineBreak)
    }

    mutating func visit(heading: Heading) {
        visit(heading)
        descendInto(heading)
    }

    mutating func visit(htmlBlock: HTMLBlock) {
        visit(htmlBlock)
        descendInto(htmlBlock)
    }

    mutating func visit(image: Image) {
        visit(image)
    }

    mutating func visit(link: Link) {
        visit(link)
        descendInto(link)
    }

    mutating func visit(list: List) {
        visit(list)
        descendInto(list)
    }

    mutating func visit(listItem: List.Item) {
        visit(listItem)
        descendInto(listItem)
    }

    mutating func visit(paragraph: Paragraph) {
        visit(paragraph)
        descendInto(paragraph)
    }

    mutating func visit(rawHTML: RawHTML) {
        visit(rawHTML)
    }

    mutating func visit(softLineBreak: SoftLineBreak) {
        visit(softLineBreak)
    }

    mutating func visit(strikethrough: Strikethrough) {
        visit(strikethrough)
        descendInto(strikethrough)
    }

    mutating func visit(strong: Strong) {
        visit(strong)
        descendInto(strong)
    }

    mutating func visit(table: Table) {
        visit(table)
        descendInto(table)
    }

    mutating func visit(tableCell: Table.Cell) {
        visit(tableCell)
        descendInto(tableCell)
    }

    mutating func visit(tableHead: Table.Head) {
        visit(tableHead)
        descendInto(tableHead)
    }

    mutating func visit(tableRow: Table.Row) {
        visit(tableRow)
        descendInto(tableRow)
    }

    mutating func visit(text: Text) {
        visit(text)
    }

    mutating func visit(thematicBreak: ThematicBreak) {
        visit(thematicBreak)
    }
}
