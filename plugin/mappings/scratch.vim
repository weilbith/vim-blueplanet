if !exists('g:which_key_map') | let g:which_key_map = {} | endif
if !exists('g:which_key_map.g') | le:which_key_map.g = { 'name': '+special' } | endif
let g:which_key_map.g.s = { 'name': '+scratch' }


nnoremap gss :<C-u>Scratch<CR>
let g:which_key_map.g.s.s = 'open scratch pad'

nnoremap gsS :<C-u>ScratchPreview<CR>
let g:which_key_map.g.s.S = 'open scratch pad in preview window'
