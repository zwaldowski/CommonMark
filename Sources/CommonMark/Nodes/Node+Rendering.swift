import cmark_gfm

public extension Node {
    /// Formats for rendering a node.
    enum RenderingFormat {
        /// Plain text
        case plain

        /// CommonMark
        case commonmark

        /// HTML
        case html

        /// XML
        case xml

        /// LaTeX
        case latex

        /// Manpage
        case manpage
    }

    /// Options for rendering a CommonMark node.
    struct RenderingOptions: OptionSet {
        public var rawValue: Int32

        public init(rawValue: Int32 = CMARK_OPT_DEFAULT) {
            self.rawValue = rawValue
        }

        /**
         Render raw HTML and "unsafe" links.

         A link is considered to be "unsafe"
         if its scheme is `javascript:`, `vbscript:`, or `file:`,
         or if its scheme is `data:`
         and the MIME type of the encoded data isn't one of the following:

         - `image/png`
         - `image/gif`
         - `image/jpeg`
         - `image/webp`

         By default,
         raw HTML is replaced by a placeholder HTML comment.
         Unsafe links are replaced by empty strings.

         - Important: This option has an effect only when rendering HTML.
         */
        public static let unsafe = Self(rawValue: CMARK_OPT_UNSAFE)

        /**
         Render softbreak elements as spaces.

         - Important: This option has no effect when rendering XML.
         */
        public static let noBreaks = Self(rawValue: CMARK_OPT_NOBREAKS)

        /**
         Render softbreak elements as hard line breaks.

         - Important: This option has no effect when rendering XML.
         */
        public static let hardBreaks = Self(rawValue: CMARK_OPT_HARDBREAKS)

        /**
         Include a `data-sourcepos` attribute on all block elements
         to map the rendered output to the source input.

         - Important: This option has an effect only when rendering HTML or XML.
         */
        public static let includeSourcePosition = Self(rawValue: CMARK_OPT_SOURCEPOS)
    }

    /**
     Render a node into a given format with the specified options.

     - Parameters:
        - format: The rendering format
        - options: The rendering options
        - width: The column width used to wrap lines for rendered output
                 (`.commonmark`, `.man`, and `.latex` formats only).
                 Must be a positive number.
                 Pass `0` to prevent line wrapping.
     - Returns: The rendered text.
     */
    func render(format: RenderingFormat, options: RenderingOptions = [], width: Int = 0) -> String {
        precondition(width >= 0)

        switch format {
        case .plain:
            cString = cmark_render_plaintext(cmark_node, options.rawValue, Int32(clamping: width))
        case .commonmark:
            return String(cString: cmark_render_commonmark(cmark_node, options.rawValue, Int32(clamping: width)))
        case .html:
            return String(cString: cmark_render_html(cmark_node, options.rawValue, nil))
        case .xml:
            return String(cString: cmark_render_xml(cmark_node, options.rawValue))
        case .latex:
            return String(cString: cmark_render_latex(cmark_node, options.rawValue, Int32(clamping: width)))
        case .manpage:
            return String(cString: cmark_render_man(cmark_node, options.rawValue, Int32(clamping: width)))
        }
    }
}

// MARK: - CustomStringConvertible

extension Node: CustomStringConvertible {
    public var description: String {
        return String(cString: cmark_render_commonmark(cmark_node, 0, 0))
    }
}
