" Select a entry from the YankRing.
" Open the YankRing window of not open yet.
" Request for the id of an entry in the ring.
" Insert the entry to the current cursor position.
" Close the YankRing window if it wasn't open before.
" Require the YankRing plugin (obviously).
"
function! utils#copy_paste#getYRElem() abort
  let l:current = win_getid() " Get current window id, to jump back if necessary.
  let l:number = bufwinnr('*YankRing*') " Get the window id of the YankRing, if it is open.

  " If the YankRing is not visible, open it and jump back to the file to edit.
  " The manual redraw is necessary, cause else the window will be opened after the function ends.
  execute('YRShow 0')
  execute('redraw')
  call win_gotoid(l:current)

  " Request for a YankRing entry number and paste it to the current buffer.
  let l:element_number = input('Element Number: ')
  execute('YRGetElem '.l:element_number)

  " If the YankRing wasn't visible before, close it again after. Else leave it open.
  if l:number < 0
    execute('YRShow 1')
  endif
endfunction


" Toggle the YankRing window.
" The extra feature its, that on open the window, it jumps back to the
" previous one, where the toggle has been invoked.
"
function! utils#copy_paste#toggleYRShow() abort
  let l:current = win_getid()
  execute('YRShow')
  call win_gotoid(l:current)
endfunction
