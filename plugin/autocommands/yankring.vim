augroup YankRingCustom
  autocmd!
  autocmd BufNewFile * call plugin#yankring#fix_window_height()
augroup END
