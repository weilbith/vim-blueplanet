lua require('lsp.handler.formatting').setup()

augroup Formatting
  autocmd!
  autocmd BufWritePost * lua require('lsp.utils.formatting').formatBufferIfPossible()
augroup END
