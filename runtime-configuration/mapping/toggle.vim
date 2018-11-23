" Plugin Toggles
" The NERDtree window.
nnoremap <silent> <F2> :<C-u>call utils#windows#switch_site_window({'open': 'NERDTreeToggle', 'close': 'NERDTreeToggle'})<CR>

" The Tagbar window.
nnoremap <silent> <F3> :TagbarToggle<CR>

" The Tabman window.
nnoremap <silent> <F4> :<C-u>call utils#windows#switch_site_window({'open': 'TMToggle', 'close': 'TMToggle'})<CR>

" Show Undo Tree. (Close Nerdtree for that cause it resize else)
nnoremap <S-u> :<C-u>call utils#windows#switch_site_window({'open': 'UndotreeShow', 'close': 'UndotreeHide'})<CR>

" Show YankRing window.
nnoremap <silent> <leader>yw :<C-u>call <SID>toggleYRShow()<CR>


" Other Toggles
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
