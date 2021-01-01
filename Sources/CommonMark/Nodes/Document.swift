import cmark_gfm
import cmark_gfm_extensions

/// A CommonMark document.
public final class Document: Node, Basic, BlockContainer {
    /// Options for parsing CommonMark text.
    public struct ParseOptions {
        /// Convert ASCII punctuation characters
        /// to "smart" typographic punctuation characters.
        ///
        /// - Straight quotes (" and ') become curly quotes (“ ” and ‘ ’)
        /// - Dashes (-- and ---) become en-dashes (–) and em-dashes (—)
        /// - Three consecutive full stops (...) become an ellipsis (…)
        public var smartPunctuation = false

        /// Parses tables.
        ///
        /// A table is an arrangement of data with rows and columns, consisting of a single
        /// header row, a delimiter row separating the header from the data, and zero
        /// or more data rows.
        public var tables = false

        /// Parses strikethrough.
        ///
        /// Strikethrough text is any text wrapped in two tildes (~~).
        public var strikethrough = false

        /// Parses additional automatic links without requiring the use of `<` and `>`.
        ///
        /// Extended autolinks include:
        /// - A valid email address.
        /// - A valid domain (`www.commonmark.org`)
        /// - A URL with one of the schemes `http://`, or `https://`, followed by whitespace.
        ///
        /// All extended autolinks may only come at the beginning of a line, after
        /// whitespace, or after a delimiting character *, _, ~, or (.
        public var automaticLinks = false

        /// Parses task list items in lists.
        ///
        /// A task list item is a list item prefixed by a number of spaces and checkbox, either
        /// empty (`[ ]`) or filled (`[x]`).
        public var taskLists = false

        /// Creates the default options.
        public init() {}

        /// `userInfo` key to specify `ParseOptions` for decoding CommonMark.
        public static let decodingKey = CodingUserInfoKey(rawValue: "CommonMarkParseOptionsKey")!

        /// Enables the extensions specified by [GitHub-Flavored Markdown](https://github.github.com/gfm).
        public static let githubFlavored: ParseOptions = {
            var options = ParseOptions()
            options.tables = true
            options.strikethrough = true
            options.automaticLinks = true
            options.taskLists = true
            return options
        }()
    }

    /// A position within a document.
    public struct Position: Hashable {
        /**
         The line number.

         Line numbers start at 1 and increase monotonically.
         */
        public var line: Int

        /**
         The line number.

         Column numbers start at 1 and increase monotonically.
        */
        public var column: Int
    }

    /// An error when creating a document.
    public enum Error: Swift.Error {
        /// A document couldn't be constructed with the provided source.
        case invalid
    }

    override class var cmark_node_type: cmark_node_type { return CMARK_NODE_DOCUMENT }

    /**
     Creates a document from a CommonMark string.

     - Parameter input: A CommonMark string.
     - Throws:
        - `Document.Error.invalid`
          if a document couldn't be constructed with the provided source.
     */
    public convenience init<Input>(_ input: Input, options: ParseOptions? = nil) throws where Input: StringProtocol {
        let options = options ?? ParseOptions()
        var parserOptions = CInt(0)
        if options.smartPunctuation { parserOptions |= CMARK_OPT_SMART }

        let parser = cmark_parser_new(parserOptions)
        defer { cmark_parser_free(parser) }

        if options.tables { cmark_parser_attach_syntax_extension(parser, SyntaxExtension.tables.cmark_syntax_extension) }
        if options.strikethrough { cmark_parser_attach_syntax_extension(parser, SyntaxExtension.strikethrough.cmark_syntax_extension) }
        if options.automaticLinks { cmark_parser_attach_syntax_extension(parser, SyntaxExtension.autoLink.cmark_syntax_extension) }
        if options.taskLists { cmark_parser_attach_syntax_extension(parser, SyntaxExtension.taskLists.cmark_syntax_extension) }

        input.withCString { (cString) in
            cmark_parser_feed(parser, cString, input.utf8.count)
        }

        guard let cmark_node = cmark_parser_finish(parser) else {
            throw Error.invalid
        }

        self.init(cmark_node)
    }

    public convenience init() {
        self.init(newWithExtension: nil)
    }
}

// MARK: - Comparable

extension Document.Position: Comparable {
    public static func < (lhs: Document.Position, rhs: Document.Position) -> Bool {
        return lhs.line < rhs.line || (lhs.line == rhs.line && lhs.column < rhs.column)
    }
}
