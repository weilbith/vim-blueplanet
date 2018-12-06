augroup NeomakeCustom
  autocmd!
  autocmd DirChanged * call plugin#neomake#switch_js_linter()
augroup END
