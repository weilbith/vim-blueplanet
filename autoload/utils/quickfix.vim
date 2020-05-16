" Function to jump/open (to) the quickfix window, if currently outside.
" Jump back from the quickfix window, if currently inside.
function! utils#quickfix#quickfix_jump() abort
  " Check if current buffer in the window is the quickfixlist.
  if &filetype ==# 'qf'
    wincmd p " Jump back

  " Check is a filled one exists.
  elseif len(getqflist()) <= 0
    call utils#messages#warning('Current quickfix list is empty! Go back in history or fill a new one.')

  " Jump to or open
  else
    execute 'copen'
  endif
endfunction

" Remove the current entry from the quickfix list.
"
function! utils#quickfix#remove_current_entry() abort
  if utils#location#is_location_window(win_getid()) | return | endif
  let l:index = line('.') - 1
  let l:list = getqflist()
  call remove(l:list, l:index)
  call setqflist(l:list, 'r')
endfunction
