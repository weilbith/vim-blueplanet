augroup Dictionary
  autocmd!
  autocmd VimEnter * call utils#dictionary#switch_language()
  autocmd OptionSet spelllang call utils#dictionary#switch_language()
augroup END
