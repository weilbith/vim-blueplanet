" Select whole buffer visually (to copy it then).
nnoremap <C-a> ggVG

" Copy to clipboard from visual mode.
xnoremap <C-c> "+y

" Paste from clipboard with auto paste mode.
nnoremap <C-v> :set paste<CR>"+p:set nopaste<CR>
inoremap <C-v> <esc>:set paste<CR>"+p:set nopaste<CR>a


" YankRing 
" Insert number of YankRing to paste.
nnoremap <leader>yy :<C-u>call <SID>getYRElem()<CR>

" Further mappings to circle trough YankRing entries must be defined in the
" plugin configuration itself.



" Functions

" Select a entry from the YankRing.
" Open the YankRing window of not open yet.
" Request for the id of an entry in the ring.
" Insert the entry to the current cursor position.
" Close the YankRing window if it wasn't open before.
" Require the YankRing plugin (obviously).
"
function! s:getYRElem()
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
