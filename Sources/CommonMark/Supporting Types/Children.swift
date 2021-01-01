import cmark_gfm

public struct Children<Element> where Element: Node {
    let parent: Node
}

extension Children: BidirectionalCollection {
    public struct Index: Comparable {
        let cmark_node: UnsafeMutablePointer<cmark_node>?
        let indexInParent: Int

        public static func < (lhs: Self, rhs: Self) -> Bool {
            guard lhs.cmark_node != nil else { return false }
            guard rhs.cmark_node != nil else { return true }
            return lhs.indexInParent < rhs.indexInParent
        }
    }

    public var startIndex: Index {
        guard let firstChild = cmark_node_first_child(parent.cmark_node) else { return endIndex }
        return Index(cmark_node: firstChild, indexInParent: 0)
    }

    public var endIndex: Index {
        return Index(cmark_node: nil, indexInParent: .max)
    }

    public subscript(_ i: Index) -> Element {
        guard let cmark_node = i.cmark_node else { preconditionFailure("Index out of bounds") }
        let node = Node.create(for: cmark_node, referencing: parent)
        return node as! Element
    }

    public func index(after i: Index) -> Index {
        precondition(i.cmark_node != nil, "Cannot increment past endIndex")
        guard let nextChild = cmark_node_next(i.cmark_node) else { return endIndex }
        return Index(cmark_node: nextChild, indexInParent: i.indexInParent + 1)
    }

    public func index(before i: Index) -> Index {
        if let cmark_node = i.cmark_node {
            precondition(i.indexInParent != 0, "Cannot decrement beyond startIndex")
            return Index(cmark_node: cmark_node_previous(cmark_node), indexInParent: i.indexInParent - 1)
        } else {
            return Index(cmark_node: cmark_node_last_child(parent.cmark_node), indexInParent: count - 1)
        }
    }
}

extension Children: RangeReplaceableCollection {
    public init() {
        self.init(parent: CustomBlock())
    }

    public func replaceSubrange<Children>(_ subrange: Range<Index>, with newChildren: Children) where Children: Collection, Children.Element == Element {
        let insertionNode = suffix(from: subrange.upperBound).first
        let toRemove = Array(self[subrange])
        let toInsert = Array(newChildren)

        for child in toRemove {
            child.removeFromParent()
        }

        if let lastToInsert = toInsert.last {
            if let insertionNode = insertionNode {
                insert(lastToInsert, before: insertionNode)
            } else {
                append(lastToInsert)
            }

            for child in toInsert.dropLast() {
                insert(child, before: lastToInsert)
            }
        }
    }

    func add(_ child: Element, using handler: (UnsafeMutablePointer<cmark_node>, UnsafeMutablePointer<cmark_node>) -> Int32) {
        guard handler(parent.cmark_node, child.cmark_node) != 0 else {
            preconditionFailure("Invalid node added to parent")
        }
        child.owner = parent.owner ?? parent
        child.managed = false
    }

    public func prepend(_ child: Element) {
        add(child) {
            cmark_node_prepend_child($0, $1)
        }
    }

    public func append(_ child: Element) {
        add(child) {
            cmark_node_append_child($0, $1)
        }
    }

    public func insert(_ child: Element, before sibling: Element) {
        add(child) {
            cmark_node_insert_before(sibling.cmark_node, $1)
        }
    }

    public func insert(_ child: Element, after sibling: Element) {
        add(child) {
            cmark_node_insert_after(sibling.cmark_node, $1)
        }
    }

    public func replace(_ child: Element, with replacement: Element) {
        add(replacement) {
            cmark_node_replace(child.cmark_node, $1)
        }
        
        child.managed = true
    }

    public func remove(_ child: Element) {
        guard child.parent == parent else { return }
        child.removeFromParent()
    }
}
