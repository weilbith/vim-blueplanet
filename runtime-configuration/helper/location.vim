" Function to jump/open (to) the location window, if currently outside.
" Jump back from the location window, if currently inside.
function! location#location_jump()
  " Make sure a location list for the current window exit.
  if len(getloclist(0)) == 0
    call utilities#show_warning_message("No location list for the current window!")
    return
  endif

  " Check if current buffer in the window is the location or quickfix list.
  if &filetype == 'qf'
    wincmd p " Jump back
  else
    " Jump to or open
    exe "lopen"
  endif
endfunction

" Determine if the window with the given id shows the location list.
"
" Argumens:
"   winid - id of the window to check
"
function! location#is_location_window(winid) 
  let dict = getwininfo(a:winid)
  if len(dict) > 0 && get(dict[0], 'quickfix', 0) && get(dict[0], 'loclist', 0) 
    return v:true
  else 
    return v:false
  endif
endfunction
