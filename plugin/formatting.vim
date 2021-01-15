lua require('lsp_handler.formatting').setup()

augroup Formatting
  autocmd!
  autocmd BufWritePost * lua require('lsp_helper.formatting').formatBufferIfPossible()
augroup END
