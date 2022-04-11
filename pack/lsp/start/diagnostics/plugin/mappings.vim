nnoremap ]d <cmd>lua vim.diagnostic.goto_next({ float = { border = 'single', focusable = false }})<CR>
nnoremap [d <cmd>lua vim.diagnostic.goto_prev({ float = { border = 'single', focusable = false }})<CR>
nnoremap [D <cmd>lua vim.diagnostic.open_float(nil, { border = 'single', focusable = false })<CR>
