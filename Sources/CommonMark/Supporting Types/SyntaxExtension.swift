import cmark_gfm_extensions

enum SyntaxExtension: String {
    case tables = "table"
    case strikethrough
    case autoLink = "autolink"
    case tagFilter = "tagfilter"
    case taskLists = "tasklist"

    static let ensureRegistered: Void = cmark_gfm_core_extensions_ensure_registered()

    var cmark_syntax_extension: UnsafeMutablePointer<cmark_syntax_extension>? {
        Self.ensureRegistered
        return cmark_find_syntax_extension(rawValue)
    }
}
