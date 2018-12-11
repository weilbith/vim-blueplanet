" Request current line on Cheat.sh.
" Show result in special buffer.
nnoremap <silent> <leader>Cc :<C-u>call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 0, '!')<CR>.

" Replace in current buffer.
nnoremap <silent> <leader>Cr :<C-u>:call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 1, '!')<CR>

" Search for first error by providers.
nnoremap <silent> <leader>Ce :<C-u>call cheat#cheat("", -1, -1 , -1, 5, '!')<CR>

" Toggle comments.
nnoremap <silent> <leader>CC :<C-u>call cheat#navigate(0, 'C')<CR>
