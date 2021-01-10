augroup LspConfig
  autocmd!
  autocmd BufWritePost * lua vim.lsp.buf.formatting({})
augroup END
