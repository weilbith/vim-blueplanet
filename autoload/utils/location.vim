" Function to jump/open (to) the location window, if currently outside.
" Jump back from the location window, if currently inside.
function! utils#location#location_jump() abort
  " Make sure a location list for the current window exit.
  if len(getloclist(0)) == 0
    call utils#messages#warning('No location list for the current window!')
    return
  endif

  " Check if current buffer in the window is the location or quickfix list.
  if &filetype ==? 'qf'
    wincmd p " Jump back
  else
    " Jump to or open
    exe 'lopen'
  endif
endfunction

" Determine if the window with the given id shows the location list.
"
" Argumens:
"   winid - id of the window to check
"
function! utils#location#is_location_window(winid) abort
  let l:dict = getwininfo(a:winid)
  if len(l:dict) > 0 && get(l:dict[0], 'quickfix', 0) && get(l:dict[0], 'loclist', 0)
    return v:true
  else
    return v:false
  endif
endfunction
