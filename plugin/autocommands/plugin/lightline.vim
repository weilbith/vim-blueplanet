augroup LightlineCustom
  autocmd!
  autocmd OptionSet,BufWritePost,TextChanged * call lightline#update()
augroup END
