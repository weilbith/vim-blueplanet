" Plugin Toggles
" The NERDtree window.
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" The Tagbar window.
nnoremap <silent> <F3> :TagbarToggle<CR>

" Show Undo Tree.
nnoremap <S-u> :UndotreeToggle<CR>

" Show YankRing window.
nnoremap <silent> <leader>yw :<C-u>call <SID>toggleYRShow()<CR>


" Other Toogles
" Spell check (enabled by default).
nnoremap <silent> <F4> :setlocal spell!<CR>



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
