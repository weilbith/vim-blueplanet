" The maximum height for the location window.
let s:location_height = 5

augroup Location
  autocmd!

  " If number of entries in the location list is higher than a threshold,
  " set the window height to this threshold.
  " Else (less than) shrink it to the number of entries plus one empty line,
  " to show that this are all entries.
  autocmd! BufReadPost quickfix if utils#location#is_location_window(win_getid()) |
        \ let s:location_length = len(getloclist(0)) |
        \ if s:location_length > s:location_height |
        \   exe "resize " . s:location_height |
        \ else |
        \   exe "resize " . (s:location_length + 1) |
        \ endif

augroup END


