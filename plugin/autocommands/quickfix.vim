augroup Quickfix
  autocmd!
  autocmd BufReadPost quickfix call utils#quickfix#resize_move()
augroup END
