" The maximum height for the location window.
let s:location_height = 5


" Function to jump/open (to) the location window, if currently outside.
" Jump back from the location window, if currently inside.
"
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


" Remove the current entry from the location list.
" Uses the list of the current window to keep it easy.
"
function! utils#location#remove_current_entry() abort
  " if !utils#location#is_location_window(win_getid()) | return | endif

  let l:index = line('.') - 1
  let l:list = getloclist(0)
  call remove(l:list, l:index)
  call setloclist(0, l:list, 'r')
endfunction


" Shrink the window height of the location window.
" Use one line higher then entries in the location list, to show one empty
" line that this is all in the list.
" If the location list is longer than a configured number, it takes this
" maximum height.
"
function! utils#location#adjust_window_height() abort
  if !utils#location#is_location_window(win_getid()) | return | endif

  let s:location_length = len(getloclist(0))

  if s:location_length > s:location_height
    exe 'resize ' . s:location_height

  else
    exe 'resize ' . (s:location_length + 1)
  endif
endfunction
