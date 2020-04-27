if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.Z = { 'name': '+quit' }


nnoremap <leader>Zz :qa!<CR>
let g:which_key_map.Z.z = 'quit disregarding changes'

nnoremap <leader>Zs :xa<CR>
let g:which_key_map.Z.s = 'quit and save all buffer'
