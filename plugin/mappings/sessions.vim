" All actions are based on the vim-session plugin.
" Save the current session (overwriting).
nnoremap <leader>$s :SaveSession!<CR>

" Create a new session.
nnoremap <leader>$S :<C-u>call utils#sessions#createNewSession()<CR>

" Open a session. Will open a menu to ask which session.
nnoremap <leader>$o :OpenSession<CR>

" Delete a session. Will open a menu to ask which session.
nnoremap <leader>$d :DeleteSession<CR>
