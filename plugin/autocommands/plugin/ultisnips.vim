augroup UltisnipsCustom
  autocmd!
  autocmd CompleteDone * call plugin#ultisnips#try_expand()
augroup END
