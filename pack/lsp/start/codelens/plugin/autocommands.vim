augroup CodeLens
  autocmd!
  autocmd BufEnter,CursorHold,InsertLeave <buffer> lua pcall(vim.lsp.codelens.refresh)
augroup END
