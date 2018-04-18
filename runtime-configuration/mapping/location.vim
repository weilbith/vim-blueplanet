" Open or jump to the location window, if not in the location window now or
" jump back.
nnoremap <silent> <leader>ll :<C-u>call location#location_jump()<CR>

" Close the open location window.
nnoremap <silent> <leader>lc :<C-u>lclose<CR>

" Go to next/previous entry in the location list.
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lN :lprevious<CR>

" Switch to older location lists.
nnoremap <silent> <leader>lb :<C-u>:colder<CR><CR>
nnoremap <silent> <leader>la :<C-u>:lnewer<CR><CR>
nnoremap <silent> <leader>lh :<C-u>:history<CR>
