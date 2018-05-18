augroup Formatting
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
