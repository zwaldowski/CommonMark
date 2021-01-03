import cmark_gfm_extensions

/// A CommonMark node.
open class Node: Codable {
    class var cmark_node_type: cmark_node_type { return CMARK_NODE_NONE }
    class var cmark_syntax_extension: UnsafeMutablePointer<cmark_syntax_extension>? { nil }
    class func isCompatible(with type: cmark_node_type) -> Bool {
        self != Node.self && type == cmark_node_type
    }

    /// A pointer to the underlying `cmark_node` for the node.
    final let cmark_node: UnsafeMutablePointer<cmark_node>

    /// Whether the underlying `cmark_node` should be freed upon deallocation.
    final var managed: Bool

    /// Strong reference to the owner of the memory for `cmark_node`.
    /// `nil` indicates the underlying `cmark_node` should be freed upon deallocation.
    final var owner: Node?

    /// Creates a node with the specified `owner` over the `cmark_node` pointer.
    init(_ cmark_node: UnsafeMutablePointer<cmark_node>, owner: Node? = nil) {
        assert(Self.isCompatible(with: cmark_node_get_type(cmark_node)))
        self.cmark_node = cmark_node
        self.owner = owner
        self.managed = owner == nil
        cmark_node_set_user_data(cmark_node, Unmanaged.passUnretained(self).toOpaque())
    }

    /// Creates a new, managed node.
    init(newWithExtension syntaxExtension: SyntaxExtension?) {
        let cmark_syntax_extension = syntaxExtension?.cmark_syntax_extension ?? Self.cmark_syntax_extension
        self.cmark_node = cmark_node_new_with_ext(Self.cmark_node_type, cmark_syntax_extension)
        self.managed = true
        cmark_node_set_user_data(cmark_node, Unmanaged.passUnretained(self).toOpaque())
    }

    deinit {
        if managed, owner == nil {
            cmark_node_free(cmark_node)
        } else if cmark_node_get_user_data(cmark_node) == Unmanaged.passUnretained(self).toOpaque() {
            cmark_node_set_user_data(cmark_node, nil)
        }
    }

    // MARK: -

    /// Looks up the node previously associated with the `cmark_node` pointer.
    static func get(from cmark_node: UnsafeMutablePointer<cmark_node>) -> Node? {
        guard let opaque = cmark_node_get_user_data(cmark_node) else { return nil }
        return Unmanaged.fromOpaque(opaque).takeUnretainedValue()
    }

    /**
     Creates and returns the `Node` subclass corresponding to
     the type of a `cmark_node` pointer.

     - Parameter cmark_node: A `cmark_node` pointer.
     - Returns: An instance of a `Node` subclass.
     */
    static func create(for cmark_node: UnsafeMutablePointer<cmark_node>, referencing parent: Node) -> Node {
        if let existing = get(from: cmark_node) {
            return existing
        }

        let owner = parent.owner ?? parent
        switch cmark_node_get_type(cmark_node) {
        case CMARK_NODE_DOCUMENT:
            return Document(cmark_node, owner: owner)
        case CMARK_NODE_BLOCK_QUOTE:
            return BlockQuote(cmark_node, owner: owner)
        case CMARK_NODE_LIST:
            return List(cmark_node, owner: owner)
        case CMARK_NODE_ITEM:
            return List.Item(cmark_node, owner: owner)
        case CMARK_NODE_CODE_BLOCK where strcmp(cmark_node_get_type_string(cmark_node), SyntaxExtension.frontmatter.rawValue) == 0:
            return Frontmatter(cmark_node, owner: owner)
        case CMARK_NODE_CODE_BLOCK:
            return CodeBlock(cmark_node, owner: owner)
        case CMARK_NODE_HTML_BLOCK:
            return HTMLBlock(cmark_node, owner: owner)
        case CMARK_NODE_PARAGRAPH:
            return Paragraph(cmark_node, owner: owner)
        case CMARK_NODE_HEADING:
            return Heading(cmark_node, owner: owner)
        case CMARK_NODE_THEMATIC_BREAK:
            return ThematicBreak(cmark_node, owner: owner)
        case CMARK_NODE_TEXT:
            return Text(cmark_node, owner: owner)
        case CMARK_NODE_SOFTBREAK:
            return SoftLineBreak(cmark_node, owner: owner)
        case CMARK_NODE_LINEBREAK:
            return HardLineBreak(cmark_node, owner: owner)
        case CMARK_NODE_CODE:
            return Code(cmark_node, owner: owner)
        case CMARK_NODE_HTML_INLINE:
            return RawHTML(cmark_node, owner: owner)
        case CMARK_NODE_EMPH:
            return Emphasis(cmark_node, owner: owner)
        case CMARK_NODE_STRONG:
            return Strong(cmark_node, owner: owner)
        case CMARK_NODE_LINK:
            return Link(cmark_node, owner: owner)
        case CMARK_NODE_IMAGE:
            return Image(cmark_node, owner: owner)
        case CMARK_NODE_STRIKETHROUGH:
            return Strikethrough(cmark_node, owner: owner)
        case CMARK_NODE_TABLE:
            return Table(cmark_node, owner: owner)
        case CMARK_NODE_TABLE_ROW where cmark_gfm_extensions_get_table_row_is_header(cmark_node) != 0:
            return Table.Head(cmark_node, owner: owner)
        case CMARK_NODE_TABLE_ROW:
            return Table.Row(cmark_node, owner: owner)
        case CMARK_NODE_TABLE_CELL:
            return Table.Cell(cmark_node, owner: owner)
        case let unknown where CMARK_NODE_TYPE_INLINE_P(unknown):
            return CustomInline(cmark_node, owner: owner)
        default:
            return CustomBlock(cmark_node, owner: owner)
        }
    }

    /// The line and column range of the element in the document.
    public var range: ClosedRange<Document.Position> {
        let start = Document.Position(line: numericCast(cmark_node_get_start_line(cmark_node)), column: numericCast(cmark_node_get_start_column(cmark_node)))
        let end = Document.Position(line: max(start.line, numericCast(cmark_node_get_end_line(cmark_node))), column: max(start.column, numericCast(cmark_node_get_end_column(cmark_node))))

        return start...end
    }

    /// The parent of the element, if any.
    public var parent: Node? {
        guard let cmark_node = cmark_node_parent(cmark_node) else { return nil }
        return Node.create(for: cmark_node, referencing: self)
    }

    /// Removes the node from its parent's children.
    public func removeFromParent() {
        cmark_node_unlink(cmark_node)
        managed = true
    }

    public func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
        preconditionFailure("Method must be overridden")
    }

    // MARK: - Codable

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let commonmark = try container.decode(String.self)
        let options = decoder.userInfo[Document.ParseOptions.decodingKey] as? Document.ParseOptions
        let document = try Document(commonmark, options: options)
        if let node = document as? Self {
            self.cmark_node = node.cmark_node
        } else if let block = document.children.first as? Self, document.children.dropFirst().isEmpty {
            cmark_node_unlink(block.cmark_node)
            self.cmark_node = block.cmark_node
        } else if let paragraph = document.children.first as? Paragraph, document.children.dropFirst().isEmpty, let inline = paragraph.children.first as? Self, paragraph.children.dropFirst().isEmpty {
            cmark_node_unlink(inline.cmark_node)
            self.cmark_node = inline.cmark_node
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unsupported node type. Expected a single block node or a paragraph containing a single inline node.")
        }
        self.owner = document
        self.managed = true
        cmark_node_set_user_data(cmark_node, Unmanaged.passUnretained(self).toOpaque())
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }
}

// MARK: - Equatable

extension Node: Equatable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.cmark_node == rhs.cmark_node
    }
}

// MARK: - Hashable

extension Node: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(cmark_node)
    }
}
