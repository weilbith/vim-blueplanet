" Plugin Toggles
" The NERDtree window.
nnoremap <silent> <F2> :<C-u>call utils#windows#switch_site_window({'open': 'NERDTreeToggle', 'close': 'NERDTreeToggle'})<CR>

" The Tagbar window.
nnoremap <silent> <F3> :<C-u>call plugin#tagbar#toggle()<CR>

" The Tabman window.
nnoremap <silent> <F4> :<C-u>call utils#windows#switch_site_window({'open': 'TMToggle', 'close': 'TMToggle'})<CR>

" Show Undo Tree. (Close Nerdtree for that cause it resize else)
nnoremap <silent> <S-u> :<C-u>call utils#windows#switch_site_window({'open': 'UndotreeShow', 'close': 'UndotreeHide'})<CR>

" Show YankRing window.
nnoremap <silent> <leader>yw :<C-u>call utils#copy_paste#toggleYRShow()<CR>


" Other Toggles
" Spell check (enabled by default).
nnoremap <silent> <F5> :setlocal spell!<CR>
