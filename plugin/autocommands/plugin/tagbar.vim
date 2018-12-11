augroup TagbarCustom
  autocmd!
  autocmd VimResized * nested call plugin#tagbar#hide_show()
augroup END
