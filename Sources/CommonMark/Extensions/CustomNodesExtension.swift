import cmark_gfm_extensions

public protocol MarkdownOutputStream: TextOutputStream {
    func writeEscaped(_ string: String)
}

enum CustomNodes {
    struct Output: MarkdownOutputStream {
        var cmark_renderer: UnsafeMutablePointer<cmark_renderer>?
        var cmark_node: UnsafeMutablePointer<cmark_node>?

        func write(_ string: String) {
            guard !string.isEmpty else { return }
            cmark_renderer?.pointee.out(cmark_renderer, cmark_node, string, true, LITERAL)
        }

        func writeEscaped(_ string: String) {
            guard !string.isEmpty else { return }
            cmark_renderer?.pointee.out(cmark_renderer, cmark_node, string, true, NORMAL)
        }
    }

    struct HTMLOutput: MarkdownOutputStream {
        var cmark_renderer: UnsafeMutablePointer<cmark_html_renderer>?
        var cmark_node: UnsafeMutablePointer<cmark_node>?

        func write(_ string: String) {
            cmark_strbuf_puts(cmark_renderer?.pointee.html, string)
        }

        func writeEscaped(_ string: String) {
            houdini_escape_html(cmark_renderer?.pointee.html, string, Int32(string.utf8.count))
        }
    }

    static func makeSyntaxExtension() -> UnsafeMutablePointer<cmark_syntax_extension>? {
        let ext = cmark_syntax_extension_new(SyntaxExtension.customNodes.rawValue)

        cmark_syntax_extension_set_get_type_string_func(ext) { (self, _) in
            UnsafePointer(self?.pointee.name)
        }

        cmark_syntax_extension_set_commonmark_render_func(ext) { (self, renderer, node, event, options) in
            let isEntering = event == CMARK_EVENT_ENTER
            var output = Output(cmark_renderer: renderer, cmark_node: node)
            switch (node.map(Node.get), isEntering) {
            case (let block as CustomBlock, true):
                block.renderMarkdownStart(to: &output)

                if let prefix = block.markdownPrefix {
                    renderer?.pointee.begin_content = true
                    cmark_strbuf_puts(renderer?.pointee.prefix, prefix)
                }
            case (let block as CustomBlock, false):
                block.renderMarkdownEnd(to: &output)

                if let prefix = block.markdownPrefix, let renderer = renderer {
                    cmark_strbuf_truncate(renderer.pointee.prefix, renderer.pointee.prefix.pointee.size - CInt(prefix.utf8.count))
                }
            case (let inline as CustomInline, true):
                inline.renderMarkdownStart(to: &output)
            case (let inline as CustomInline, false):
                inline.renderMarkdownEnd(to: &output)
            default:
                return
            }
        }

        cmark_syntax_extension_set_html_render_func(ext) { (self, renderer, node, event, options) in
            let isEntering = event == CMARK_EVENT_ENTER
            var output = HTMLOutput(cmark_renderer: renderer, cmark_node: node)
            switch (node.map(Node.get), isEntering) {
            case (let block as CustomBlock, true):
                block.renderHTMLStart(to: &output)
            case (let block as CustomBlock, false):
                block.renderHTMLEnd(to: &output)
            case (let inline as CustomInline, true):
                inline.renderHTMLStart(to: &output)
            case (let inline as CustomInline, false):
                inline.renderHTMLEnd(to: &output)
            default:
                return
            }
        }

        cmark_syntax_extension_set_latex_render_func(ext) { (self, renderer, node, event, options) in
            let isEntering = event == CMARK_EVENT_ENTER
            var output = Output(cmark_renderer: renderer, cmark_node: node)
            switch (node.map(Node.get), isEntering) {
            case (let block as CustomBlock, true):
                block.renderLaTeXStart(to: &output)
            case (let block as CustomBlock, false):
                block.renderLaTeXEnd(to: &output)
            case (let inline as CustomInline, true):
                inline.renderLaTeXStart(to: &output)
            case (let inline as CustomInline, false):
                inline.renderLaTeXEnd(to: &output)
            default:
                return
            }
        }

        cmark_syntax_extension_set_man_render_func(ext) { (self, renderer, node, event, options) in
            let isEntering = event == CMARK_EVENT_ENTER
            var output = Output(cmark_renderer: renderer, cmark_node: node)
            switch (node.map(Node.get), isEntering) {
            case (let block as CustomBlock, true):
                block.renderManpageStart(to: &output)
            case (let block as CustomBlock, false):
                block.renderManpageEnd(to: &output)
            case (let inline as CustomInline, true):
                inline.renderManpageStart(to: &output)
            case (let inline as CustomInline, false):
                inline.renderManpageEnd(to: &output)
            default:
                return
            }
        }

        return ext
    }
}
