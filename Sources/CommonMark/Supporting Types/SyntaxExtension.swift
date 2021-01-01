import cmark_gfm_extensions

enum SyntaxExtension: String {
    case tables = "table"
    case strikethrough
    case autoLink = "autolink"
    case tagFilter = "tagfilter"
    case taskLists = "tasklist"
    case frontmatter
    case customNodes = "swift"

    static let ensureRegistered: Void = {
        cmark_gfm_core_extensions_ensure_registered()
        cmark_register_plugin { (plugin) in
            cmark_plugin_register_syntax_extension(plugin, Frontmatter.makeSyntaxExtension())
            cmark_plugin_register_syntax_extension(plugin, CustomNodes.makeSyntaxExtension())
            return 1
        }
    }()

    var cmark_syntax_extension: UnsafeMutablePointer<cmark_syntax_extension>? {
        Self.ensureRegistered
        return cmark_find_syntax_extension(rawValue)
    }
}
