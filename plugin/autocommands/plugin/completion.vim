augroup CompletionCustom
  autocmd!
  autocmd BufEnter * lua require'completion'.on_attach()
augroup END
