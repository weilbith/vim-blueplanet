augroup DeinUpdate
  autocmd!
  autocmd VimEnter * call plugin#dein#install()
  " autocmd VimEnter * call dein#check_update()
  " TODO: Asynchronously not work that good, cause can't work during this.
augroup END
