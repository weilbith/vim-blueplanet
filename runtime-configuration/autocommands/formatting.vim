augroup Formatting
  autocmd!
  autocmd BufWritePre * mkview | undojoin | Neoformat | loadview
augroup END
