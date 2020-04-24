augroup LightlineCustom
  autocmd!
  autocmd BufWritePost,TextChanged * call lightline#update()
augroup END
