import cmark_gfm

private let expectedFence = "---\n"
private let fence = CChar(UInt8(ascii: "-"))

extension Frontmatter {
    static func makeSyntaxExtension() -> UnsafeMutablePointer<cmark_syntax_extension>? {
        let ext = cmark_syntax_extension_new(SyntaxExtension.frontmatter.rawValue)

        cmark_syntax_extension_set_get_type_string_func(ext) { (self, _) in
            UnsafePointer(self?.pointee.name)
        }

        cmark_syntax_extension_set_open_block_func(ext) { (self, indentation, parser, parent, input, length) in
            let input = UnsafeBufferPointer(start: input, count: Int(length))
            if indentation == 0,
               parser?.pointee.line_number == 1,
               input.starts(with: expectedFence.utf8),
               cmark_node_get_type(parent) == CMARK_NODE_THEMATIC_BREAK,
               cmark_node_set_type(parent, CMARK_NODE_CODE_BLOCK) != 0,
               cmark_node_set_fenced(parent, 1, CInt(expectedFence.utf8.count) - 1, parser!.pointee.offset, fence) != 0,
               cmark_node_set_syntax_extension(parent, self) != 0 {
                return parent
            }
            return nil
        }

        cmark_syntax_extension_set_match_block_func(ext) { (_, parser, input, length, _) in
            let input = UnsafeBufferPointer(start: input, count: Int(length))
            guard input.starts(with: expectedFence.utf8) else {
                return 1
            }
            let cStringInput = UnsafeRawPointer(input.baseAddress)?.assumingMemoryBound(to: CChar.self)
            cmark_parser_advance_offset(parser, cStringInput, CInt(expectedFence.utf8.count), 0)
            return 0
        }

        cmark_syntax_extension_set_commonmark_render_func(ext) { (_, renderer, node, event, _) in
            guard event == CMARK_EVENT_ENTER else { return }
            renderer?.pointee.out(renderer, node, "---\n", false, LITERAL)
            renderer?.pointee.out(renderer, node, cmark_node_get_literal(node), false, LITERAL)
            renderer?.pointee.out(renderer, node, "---\n\n", false, LITERAL)
        }

        cmark_syntax_extension_set_plaintext_render_func(ext) { (_, _, _, _, _) in }

        cmark_syntax_extension_set_html_render_func(ext) { (_, _, _, _, _) in }

        return ext
    }

}
