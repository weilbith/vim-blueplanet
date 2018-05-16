" Plugin Toggles
" The NERDtree window.
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" The Tagbar window.
nnoremap <silent> <F3> :TagbarToggle<CR>

" The Tabman window.
nnoremap <silent> <F4> :TMToggle<CR>

" Show Undo Tree. (Close Nerdtree for that cause it resize else)
nnoremap <S-u> :<C-u>call <SID>toggle_undotree()<CR>

" Show YankRing window.
nnoremap <silent> <leader>yw :<C-u>call <SID>toggleYRShow()<CR>


" Other Toogles
" Spell check (enabled by default).
nnoremap <silent> <F5> :setlocal spell!<CR>



" Functions

" Toggle the YankRing window.
" The extra feature its, that on open the window, it jumps back to the
" previous one, where the toggle has been invoked.
" 
function! s:toggleYRShow()
  let l:current = win_getid()
  execute('YRShow')
  call win_gotoid(l:current)
endfunction


" Variable to mark if the NerdTree window was open.
" Used by the toggle_undotree function.
let s:nerdtree_was_open = v:false

" Toggle the UndoTree window.
" The advantage is, that is close a possibly open NerdTree window, if it is open.
" When close the UndoTree window again and the NerdTree was opened before,
" it will be opened again.
" Close the NerdTree window avoids resizing of the window after close the UndoTree again.
"
function! s:toggle_undotree()
   " Note: Use nerdtree toggle over show and close, to restore the old tree.

  " Check if the undo tree window is open or not.
  if bufwinnr('undotree_2') != 1
    " Check if the nerdtree window is open.
    let s:nerdtree_was_open = exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1 
   
    " Close the possibly open nerdtree window.
    if s:nerdtree_was_open
      execute ":NERDTreeToggle"
    endif

    " Finally open the undotree.
    execute ":UndotreeShow"

  else 
    " Close the undotree.
    execute ":UndotreeHide"

    " Reopen the nerdtree if it was open before.
    if s:nerdtree_was_open
      execute ":NERDTreeToggle"
      let s:nerdtree_was_open = v:false
      " The last step is not necessary, cause it gets overwritten, but is cleaner.
    endif
  endif
endfunction<`0`>
