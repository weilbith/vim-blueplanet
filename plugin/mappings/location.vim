if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.l = { 'name': '+location list' }


nnoremap <silent> <leader>ll <cmd>Lopen<CR>
let g:which_key_map.l.l = 'jump to location window (jump back if already inside)'

nnoremap <silent> <leader>lc <cmd>lclose<CR>
let g:which_key_map.l.c = 'close location window'

nnoremap <silent> <leader>l<CR> <cmd>ll<CR>
let g:which_key_map.l['<CR>'] = 'goto current selected location list entry'

nnoremap <leader>lf <cmd>Telescope loclist<CR>
let g:which_key_map.l.f = 'filter location list of current window'

nnoremap <silent> <leader>la <cmd>labove<CR>
let g:which_key_map.l.a = 'next location list entry above current cursor position'

nnoremap <silent> <leader>lb <cmd>lbelow<CR>
let g:which_key_map.l.b = 'next location list entry below current cursor positon'

nnoremap <silent> <leader>ln <cmd>lnewer<CR>
let g:which_key_map.l.n = 'open next location list'

nnoremap <silent> <leader>lN <cmd>colder<CR>
let g:which_key_map.l.N = 'open previous location list'

nnoremap <silent> <leader>lh <cmd>history<CR>
let g:which_key_map.l.h = 'open location list by history (opens selection window)'
