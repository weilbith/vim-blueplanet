if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map['$'] = { 'name': '+session' }


nnoremap <leader>$s :SaveSession!<CR>
let g:which_key_map['$'].s = 'save current session (default session if unset)'

nnoremap <leader>$S :<C-u>call utils#sessions#createNewSession()<CR>
let g:which_key_map['$'].S = 'create new session (enter name)'

nnoremap <leader>$o :OpenSession<CR>
let g:which_key_map['$'].o = 'open saved session (selection opens)'

nnoremap <leader>$d :DeleteSession<CR>
let g:which_key_map['$'].d = 'delete saved session (selection opens)'
