nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next({ wrap = false })<CR>
nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev({ wrap = false })<CR>
nnoremap ]D <cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = true })<CR>
