nnoremap ]d <cmd>lua vim.diagnostic.goto_next({ float = { border = 'single', focusable = false }})<CR>
nnoremap [d <cmd>lua vim.diagnostic.goto_prev({ float = { border = 'single', focusable = false }})<CR>
nnoremap [D <cmd>lua vim.diagnostic.open_float(nil, { scope = 'cursor', border = 'single', focusable = false })<CR>
