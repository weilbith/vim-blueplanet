if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.T = { 'name': '+tabs' }

nnoremap <leader>To :tabedit<CR>
let g:which_key_map.T.o = 'open new empty tab'

nnoremap <leader>Te :tabedit %<CR>
let g:which_key_map.T.e = 'open new tab with current buffer'

call submode#enter_with('TabSwitch', 'n', '', '<space>Tn', ':tabnext<CR>')
let g:which_key_map.T.n = 'next tab (enter TabSwitch submode)'

call submode#enter_with('TabSwitch', 'n', '', '<space>TN', ':tabprevious<CR>')
let g:which_key_map.T.N = 'previous tab (enter TabSwitch submode)'

call submode#map('TabSwitch', 'n', '', 'n', ':tabnext<CR>')
call submode#map('TabSwitch', 'n', '', 'N', ':tabprevious<CR>')

nnoremap <leader>Tc :windo bd!<bar>tabclose<CR>
let g:which_key_map.T.c = 'close tab (includes all visible buffers)'

nnoremap <silent> <leader>Tr <cmd>call utils#tabs#set_name()<CR>
let g:which_key_map.T.r = 'rename tab (enter name)'
