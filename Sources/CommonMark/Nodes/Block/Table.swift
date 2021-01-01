import cmark_gfm_extensions

/**
 A table block.

 From the [GitHub-Flavored Markdown Spec](https://github.github.com/gfm):

 > ## [4.10 Tables (extension)](https://github.github.com/gfm/#tables-extension-)
*/
public final class Table: Block, Container {
    public enum ColumnAlignment: UInt8 {
        case left = 0x6c
        case center = 0x63
        case right = 0x72
    }

    /**
     A table row.

     From the [GitHub-Flavored Markdown Spec](https://github.github.com/gfm):

     > ## [4.10 Tables (extension)](https://github.github.com/gfm/#tables-extension-)
    */
    public class Row: Block, Basic, Container {
        public typealias Child = Cell

        override class var cmark_node_type: cmark_node_type { CMARK_NODE_TABLE_ROW }
        override class var cmark_syntax_extension: UnsafeMutablePointer<cmark_syntax_extension>? { Table.cmark_syntax_extension }

        public required convenience init() {
            self.init(newWithExtension: nil)
        }
    }

    /**
     A table header row.

     From the [GitHub-Flavored Markdown Spec](https://github.github.com/gfm):

     > ## [4.10 Tables (extension)](https://github.github.com/gfm/#tables-extension-)
    */
    public final class Head: Row {
        public required convenience init() {
            self.init(newWithExtension: nil)
            cmark_gfm_extensions_set_table_row_is_header(cmark_node, 1)
        }
    }

    /**
     A table cell.

     From the [GitHub-Flavored Markdown Spec](https://github.github.com/gfm):

     > ## [4.10 Tables (extension)](https://github.github.com/gfm/#tables-extension-)
    */
    public final class Cell: Block, Basic, InlineContainer {
        override class var cmark_node_type: cmark_node_type { CMARK_NODE_TABLE_CELL }
        override class var cmark_syntax_extension: UnsafeMutablePointer<cmark_syntax_extension>? { Table.cmark_syntax_extension }

        public convenience init() {
            self.init(newWithExtension: nil)
        }
    }

    public typealias Child = Row

    override class var cmark_node_type: cmark_node_type { CMARK_NODE_TABLE }
    override class var cmark_syntax_extension: UnsafeMutablePointer<cmark_syntax_extension>? { SyntaxExtension.tables.cmark_syntax_extension }

    public convenience init(columnAlignments: [ColumnAlignment?] = [], children: [Row] = []) {
        self.init(newWithExtension: nil)
        self.columnAlignments = columnAlignments
        self.children.append(contentsOf: children)
    }

    public var numberOfColumns: Int {
        get {
            numericCast(cmark_gfm_extensions_get_table_columns(cmark_node))
        }

        set {
            cmark_gfm_extensions_set_table_columns(cmark_node, numericCast(newValue))
        }
    }

    public var columnAlignments: [ColumnAlignment?] {
        get {
            UnsafeBufferPointer(start: cmark_gfm_extensions_get_table_alignments(cmark_node), count: numberOfColumns)
                .map(ColumnAlignment.init)
        }

        set {
            var rawColumnAlignments = newValue.map { $0?.rawValue ?? 0 }
            cmark_gfm_extensions_set_table_alignments(cmark_node, numericCast(rawColumnAlignments.count), &rawColumnAlignments)
        }
    }
}
