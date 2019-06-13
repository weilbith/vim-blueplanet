if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.C = { 'name': '+cheat' }

nnoremap <silent> <leader>Cc :<C-u>call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 0, '!')<CR>.
let g:which_key_map.C.c = 'search current line on cheat.sh (opens new window)'

nnoremap <silent> <leader>Cr :<C-u>:call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 1, '!')<CR>
let g:which_key_map.C.r = 'search current line on cheat.sh (replace current line)'

nnoremap <silent> <leader>Ce :<C-u>call cheat#cheat("", -1, -1 , -1, 5, '!')<CR>
let g:which_key_map.C.e = 'search first error on cheat.sh (opens new window)'

nnoremap <silent> <leader>CC :<C-u>call cheat#navigate(0, 'C')<CR>
let g:which_key_map.C.C = 'remove comments of cheat.sh replacement'
