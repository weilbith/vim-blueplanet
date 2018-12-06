augroup Location
  autocmd!
  autocmd! BufReadPost quickfix call utils#location#adjust_window_height()
augroup END
