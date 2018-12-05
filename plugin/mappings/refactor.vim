" Rename the word under the cursor.
nnoremap <silent> <leader>rr :<C-u>call utils#refactor#rename(expand('<cword>'))<CR>

" Rename the current selection.
vnoremap <silent> <leader>rr :<C-u>call utils#refactor#rename(utils#msc#get_visual_selection())<CR>

" Rename with Far plugin for more control.
" Visual mode selection must be defined with * as search pattern.
nnoremap <leader>rR :<C-u> Farp<CR>
vnoremap <leader>rR :<C-u> Farp<CR>
nnoremap <leader>rd :<C-u> Fardo<CR>
nnoremap <leader>ru :<C-u> Farundo<CR>
