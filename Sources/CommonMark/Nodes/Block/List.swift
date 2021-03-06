import cmark_gfm_extensions

/**
 An ordered list.

 From the [CommonMark Spec](https://spec.commonmark.org/0.29):

 > ## [5.3 Lists](https://spec.commonmark.org/0.29/#lists)
 >
 > A list is a sequence of one or more list items of the same type.
 > The list items may be separated by any number of blank lines.

 > ## [5.2 List items](https://spec.commonmark.org/0.29/#list-items)
 >
 > A list marker is a bullet list marker or an ordered list marker.
 >
 > An ordered list marker is a sequence of 1–9 arabic digits (0-9),
 > followed by either a . character or a ) character.
 > (The reason for the length limit is that
 > with 10 digits we start seeing integer overflows in some browsers.)
*/
public final class List: Block, Container {
    public enum Kind: Hashable {
        case bullet
        case ordered
    }

    public enum Delimiter: Hashable {
        case none
        case period(Int = 1)
        case parenthesis(Int = 1)

        init(_ cmark_node: UnsafeMutablePointer<cmark_node>) {
            switch cmark_node_get_list_delim(cmark_node) {
                case CMARK_PERIOD_DELIM:
                    self = .period(numericCast(cmark_node_get_list_start(cmark_node)))
                case CMARK_PAREN_DELIM:
                    self = .parenthesis(numericCast(cmark_node_get_list_start(cmark_node)))
                default:
                    self = .none
            }
        }
    }

    public final class Item: Block, Basic, BlockContainer {
        override class var cmark_node_type: cmark_node_type { return CMARK_NODE_ITEM }

        public convenience init() {
            self.init(newWithExtension: nil)
        }

        public convenience init(checked: Bool) {
            self.init(newWithExtension: .taskLists)
            self.checked = checked
        }

        public convenience init<Children>(checked: Bool, children: Children) where Children: Sequence, Children.Element == Block {
            self.init(checked: checked)
            self.children.append(contentsOf: children)
        }

        public convenience init<Children>(checked: Bool, children: Children) where Children: Sequence, Children.Element == Inline {
            self.init(checked: checked, children: [Paragraph(children: children)])
        }

        /// Indicates completion of a task, or some other off/on information.
        public var checked: Bool {
            get {
                cmark_gfm_extensions_get_tasklist_item_checked(cmark_node)
            }
            set {
                if newValue {
                    cmark_node_set_syntax_extension(cmark_node, SyntaxExtension.taskLists.cmark_syntax_extension)
                }
                cmark_gfm_extensions_set_tasklist_item_checked(cmark_node, newValue)
            }
        }

        public override func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
            visitor.visit(listItem: self)
        }
    }

    public typealias Child = Item

    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_LIST }

    public convenience init(delimiter: Delimiter) {
        self.init(newWithExtension: nil)
        self.delimiter = delimiter
    }

    public convenience init<Children>(delimiter: Delimiter, children: Children) where Children: Sequence, Children.Element == Item {
        self.init(delimiter: delimiter)
        self.children.append(contentsOf: children)
    }

    public var kind: Kind {
        return delimiter == .none ? .bullet : .ordered
    }

    public var delimiter: Delimiter {
        get {
            return Delimiter(cmark_node)
        }

        set {
            switch newValue {
            case .period(let listStart):
                cmark_node_set_list_type(cmark_node, CMARK_ORDERED_LIST)
                cmark_node_set_list_delim(cmark_node, CMARK_PERIOD_DELIM)
                cmark_node_set_list_start(cmark_node, numericCast(listStart))
            case .parenthesis(let listStart):
                cmark_node_set_list_type(cmark_node, CMARK_ORDERED_LIST)
                cmark_node_set_list_delim(cmark_node, CMARK_PAREN_DELIM)
                cmark_node_set_list_start(cmark_node, numericCast(listStart))
            default:
                cmark_node_set_list_type(cmark_node, CMARK_BULLET_LIST)
            }
        }
    }

    /**
     Whether the list is loose.

     From the [CommonMark Spec](https://spec.commonmark.org/0.29):

     > A list is loose if any of its constituent list items
     > are separated by blank lines,
     > or if any of its constituent list items
     > directly contain two block-level elements with a blank line between them.
     > Otherwise a list is tight.
     */
    public var loose: Bool {
        get {
            return !tight
        }

        set {
            tight = !newValue
        }
    }

    /**
     Whether the list is tight.

     - SeeAlso: `loose`
    */
    public var tight: Bool {
        get {
            return cmark_node_get_list_tight(cmark_node) == 1 ? true : false
        }

        set {
            cmark_node_set_list_tight(cmark_node, newValue ? 1 : 0)
        }
    }

    public override func accept<Visitor>(_ visitor: inout Visitor) -> Visitor.Result where Visitor: CommonMark.Visitor {
        visitor.visit(list: self)
    }
}
