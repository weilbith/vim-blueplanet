" Function to jump/open (to) the location window, if currently outside.
" Jump back from the location window, if currently inside.
"
function! utils#location#location_jump() abort
  " Jump back if current buffer in the window is the location or quickfix list.
  if &filetype ==? 'qf'
    wincmd p

  " Check is a filled one exists.
  elseif len(getloclist(0)) <= 0
    call utils#messages#warning('Current location list is empty! Go back in history or fill a new one.')

  " Jump to or open
  else
    execute 'lopen'
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
