function! utils#yankring#fix_window_height() abort
  if @% ==# '[YankRing]'
    set winfixheight
  endif
endfunction
