nnoremap ]d <cmd>lua vim.diagnostic.goto_next({ popup_opts = { border = 'single', focusable = false }})<CR>
nnoremap [d <cmd>lua vim.diagnostic.goto_prev({ popup_opts = { border = 'single', focusable = false }})<CR>
nnoremap [D <cmd>lua vim.diagnostic.show_line_diagnostics({ show_header = true, border = 'single', focusable = false })<CR>
