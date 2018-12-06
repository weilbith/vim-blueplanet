augroup Session
  autocmd!
  autocmd BufReadPost * call utils#msc#restore_cursor_position()
augroup END
