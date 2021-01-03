import cmark_gfm

public protocol Linked: Node {}

public extension Linked {
    var urlString: String {
        get {
            guard let cString = cmark_node_get_url(cmark_node) else { return "" }
            return String(cString: cString)
        }

        set {
            cmark_node_set_url(cmark_node, newValue)
        }
    }

    var title: String? {
        get {
            guard let cString = cmark_node_get_title(cmark_node) else { return nil }
            return String(cString: cString)
        }

        set {
            cmark_node_set_title(cmark_node, newValue)
        }
    }
}
