if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.f = { 'name': '+files' }


nnoremap <silent> <leader>ff <cmd>Denite file/rec<CR>
let g:which_key_map.f.f = 'fuzzy search files from root recursively (Denite)'

nnoremap <silent> <leader>fb <cmd>DeniteBufferDir file/rec<CR>
let g:which_key_map.f.b = 'fuzzy search files from current file directory (Denite)'

nnoremap <silent> <leader>ft <cmd>NERDTreeFind<CR>
let g:which_key_map.f.b = 'show current file in file tree window (open it if not already)'
