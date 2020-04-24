augroup VistCustom
  autocmd!
  autocmd VimResized * nested call plugin#vista#hide_show()
  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
augroup END
