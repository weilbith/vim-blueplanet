if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.r = { 'name': '+refactor' }


nnoremap <silent> <leader>rr :<C-u>call utils#refactor#rename(expand('<cword>'))<CR>
let g:which_key_map.r.r = 'rename object under cursor (could be replaced by language server)'

vnoremap <silent> <leader>rr :<C-u>call utils#refactor#rename(utils#msc#get_visual_selection())<CR>

nnoremap <leader>rR :<C-u> Farp<CR>
let g:which_key_map.r.R = 'trigger rename object in whole project with control (opens control window)'

vnoremap <leader>rR :<C-u> Farp<CR>

nnoremap <leader>rd :<C-u> Fardo<CR>
let g:which_key_map.r.d = 'apply triggered and controlled rename of object'

nnoremap <leader>ru :<C-u> Farundo<CR>
let g:which_key_map.r.u = 'undo last applied rename of object'
