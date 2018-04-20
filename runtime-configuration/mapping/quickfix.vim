" Open or jump to the quickfix window, if not in the quickfix window now or
" jump back (jump back not working if preview window for quickfix window is open)
nnoremap <silent> <leader>qq :<C-u>call quickfix#quickfix_jump()<CR>

" Close the open quickfix window.
nnoremap <silent> <leader>qc :<C-u>call quickfix#quickfix_close(v:true)<CR>

" Go to next/previous entry in the quickfix list.
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qN :cprevious<CR>

" Toggle preview window and show file currently under the cursor.
" Jump to the quickfix window if not already inside.
nnoremap <silent> <leader>qp :<C-u>call quickfix#toggle_quickfix_preview()<CR>

" Edit the currently preview in the active window.
nnoremap <silent> <leader>qP :<C-u>call quickfix#open_quickfix_preview_file()<CR>

" Switch to older quickfix lists.
nnoremap <silent> <leader>qb :<C-u>:colder<CR><CR>
nnoremap <silent> <leader>qa :<C-u>:cnewer<CR><CR>
nnoremap <silent> <leader>qh :<C-u>:chistory<CR>

