lua require('lsp_handler.formatting').setup()

augroup Formatting
  autocmd!
  autocmd BufWritePost * lua pcall(vim.lsp.buf.formatting, {})
augroup END
