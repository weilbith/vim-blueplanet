if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.b = { 'name': '+buffer' }


call submode#enter_with('BufferSwitch', 'n', 's', '<space>bn', '<cmd>bnext<CR>')
let g:which_key_map.b.n = 'next buffer (enter BufferSwitch submode)'

call submode#enter_with('BufferSwitch', 'n', 's', '<space>bN', '<cmd>bprevious<CR>')
let g:which_key_map.b.N = 'previous buffer (enter BufferSwitch submode)'

call submode#map('BufferSwitch', 'n', 's', 'n', '<cmd>bnext<CR>')
call submode#map('BufferSwitch', 'n', 's', 'N', '<cmd>bprevious<CR>')

nnoremap <silent> <leader>bd <cmd>call utils#buffers#delete_buffer(v:true, v:false)<CR>
let g:which_key_map.b.d = 'close buffer and safe (keeps window open)'

nnoremap <silent> <leader>bD <cmd>call utils#buffers#delete_buffer(v:false, v:true)<CR>
let g:which_key_map.b.D = 'close buffer disregarding changes (keeps window open)'

nnoremap <leader>bb <cmd>Telescope buffers<CR>
let g:which_key_map.b.b = 'fuzzy search open buffers'

" Do no use the [N]b(uffer) command, cause it does not relate with the visual tab bar ids.
nmap <leader>b1 <Plug>lightline#bufferline#go(1)
nmap <leader>b2 <Plug>lightline#bufferline#go(2)
nmap <leader>b3 <Plug>lightline#bufferline#go(3)
nmap <leader>b4 <Plug>lightline#bufferline#go(4)
nmap <leader>b5 <Plug>lightline#bufferline#go(5)
nmap <leader>b6 <Plug>lightline#bufferline#go(6)
nmap <leader>b7 <Plug>lightline#bufferline#go(7)
nmap <leader>b8 <Plug>lightline#bufferline#go(8)
nmap <leader>b9 <Plug>lightline#bufferline#go(9)
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
