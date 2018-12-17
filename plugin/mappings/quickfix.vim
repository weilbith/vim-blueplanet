" Open or jump to the quickfix window, if not in the quickfix window now or
" jump back (jump back not working if preview window for quickfix window is open)
nnoremap <silent> <leader>qq :<C-u>call utils#quickfix#quickfix_jump()<CR>

" Close the open quickfix window.
nnoremap <silent> <leader>qc :<C-u>call utils#quickfix#quickfix_close(v:true)<CR>

" Go to the current/next/previous entry in the quickfix list.
nnoremap <leader>q<CR> :cc<CR>
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qN :cprevious<CR>

" Toggle preview window and show file currently under the cursor.
" Jump to the quickfix window if not already inside.
nnoremap <silent> <leader>qp :<C-u>call utils#quickfix#toggle_quickfix_preview()<CR>

" Edit the currently preview in the active window.
nnoremap <silent> <leader>qP :<C-u>call utils#quickfix#open_quickfix_preview_file()<CR>

" Switch to older quickfix lists.
nnoremap <silent> <leader>qb :<C-u>:colder<CR>
nnoremap <silent> <leader>qa :<C-u>:cnewer<CR>
nnoremap <silent> <leader>qh :<C-u>:chistory<CR>

" Store/restore quickfix list with name.
nnoremap <silent> <leader>qs :<C-u>call utils#quickfix#store_current_list()<CR>
nnoremap <silent> <leader>ql :<C-u>call utils#quickfix#select_stored_list()<CR>


" Special mappings for the quickfix buffer are at the related filetype plugin.
