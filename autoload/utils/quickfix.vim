" Remove the current entry from the quickfix list.
"
function! utils#quickfix#remove_current_entry() abort
  if utils#location#is_location_window(win_getid()) | return | endif
  let l:index = line('.') - 1
  let l:list = getqflist()
  call remove(l:list, l:index)
  call setqflist(l:list, 'r')
endfunction
