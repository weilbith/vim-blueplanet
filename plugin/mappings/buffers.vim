if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.b = { 'name': '+buffer' }


call submode#enter_with('BufferSwitch', 'n', 's', '<space>bn', '<cmd>bnext<CR>')
let g:which_key_map.b.n = 'next buffer (enter BufferSwitch submode)'

call submode#enter_with('BufferSwitch', 'n', 's', '<space>bN', '<cmd>bprevious<CR>')
let g:which_key_map.b.N = 'previous buffer (enter BufferSwitch submode)'

call submode#map('BufferSwitch', 'n', 's', 'n', '<cmd>bnext<CR>')
call submode#map('BufferSwitch', 'n', 's', 'N', '<cmd>bprevious<CR>')

nnoremap <silent> <leader>bd <cmd>Sayonara!<CR>
let g:which_key_map.b.d = 'close buffer but keep window'

nnoremap <leader>bb <cmd>Telescope buffers<CR>
let g:which_key_map.b.b = 'fuzzy search open buffers'

" Do no use the [N]b(uffer) command, cause it does not relate with the visual tab bar ids.
nmap <leader>b1 <cmd>BufferGoto 1<CR>
nmap <leader>b2 <cmd>BufferGoto 2<CR>
nmap <leader>b3 <cmd>BufferGoto 3<CR>
nmap <leader>b4 <cmd>BufferGoto 4<CR>
nmap <leader>b5 <cmd>BufferGoto 5<CR>
nmap <leader>b6 <cmd>BufferGoto 6<CR>
nmap <leader>b7 <cmd>BufferGoto 7<CR>
nmap <leader>b8 <cmd>BufferGoto 8<CR>
nmap <leader>b9 <cmd>BufferGoto 9<CR>
let g:which_key_map.b.1 = 'which_key_ignore'
let g:which_key_map.b.2 = 'which_key_ignore'
let g:which_key_map.b.3 = 'which_key_ignore'
let g:which_key_map.b.4 = 'which_key_ignore'
let g:which_key_map.b.5 = 'which_key_ignore'
let g:which_key_map.b.6 = 'which_key_ignore'
let g:which_key_map.b.7 = 'which_key_ignore'
let g:which_key_map.b.8 = 'which_key_ignore'
let g:which_key_map.b.9 = 'which_key_ignore'
let g:which_key_map.b['1...9'] = 'select buffer by number'
