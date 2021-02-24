nnoremap <unique> <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next({ wrap = false })<CR>
nnoremap <unique> <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev({ wrap = false })<CR>
