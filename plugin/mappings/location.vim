if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.l = { 'name': '+location list' }


nnoremap <silent> <leader>ll :<C-u>call utils#location#location_jump()<CR>
let g:which_key_map.l.l = 'jump to location window (jump back if already inside)'

nnoremap <silent> <leader>lc :<C-u>lclose<CR>
let g:which_key_map.l.c = 'close location window'

nnoremap <silent> <leader>l<CR> :ll<CR>
let g:which_key_map.l['<CR>'] = 'goto current selected location list entry'

nnoremap <silent> <leader>ln :<C-u>call utils#location#find_entry_by_position()<CR>
let g:which_key_map.l.n = 'next location list entry'

nnoremap <silent> <leader>lN :<C-u>call utils#location#find_entry_by_position(v:true)<CR>
let g:which_key_map.l.N = 'previous location list entry'

nnoremap <silent> <leader>la :<C-u>:lnewer<CR><CR>
let g:which_key_map.l.a = 'open next location list'

nnoremap <silent> <leader>lb :<C-u>:colder<CR><CR>
let g:which_key_map.l.b = 'open previous location list'

nnoremap <silent> <leader>lh :<C-u>:history<CR>
let g:which_key_map.l.h = 'open location list by history (opens selection window)'
