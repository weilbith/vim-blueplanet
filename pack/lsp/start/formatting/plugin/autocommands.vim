augroup Formatting
  autocmd!
  autocmd BufWritePre * lua require('lsp.formatting').formatBufferIfPossible()
augroup END
