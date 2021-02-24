augroup Formatting
  autocmd!
  autocmd BufWritePost * lua require('lsp.formatting').formatBufferIfPossible()
augroup END
