augroup TestCustom
  autocmd!
  autocmd Bufwrite * if test#exists() | TestFile -strategy=asyncrun_background | endif
augroup END
