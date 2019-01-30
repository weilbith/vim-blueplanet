augroup Location
  autocmd!
  autocmd BufReadPost quickfix call utils#location#adjust_window_height()
  autocmd BufWinEnter * call utils#location#restore_location_list(expand('<abuf>'))
  autocmd BufWinLeave * call utils#location#cache_location_list(expand('<abuf>'))
  autocmd QuitPre * call utils#location#close_related_location_window()
  autocmd BufDelete * call utils#location#remove_cached_location_list(expand('<abuf>'))
augroup END
