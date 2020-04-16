if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.t = { 'name': '+tags' }


nnoremap <leader>to <cmd>call utils#tags#open()<CR>
let g:which_key_map.t.o = 'jump to definition (LSP or Tag)'

nnoremap <leader>tp <cmd>call utils#tags#preview()<CR>
let g:which_key_map.t.p = 'preview definition (LSP or Tag)'

nnoremap <leader>tl <cmd>call utils#tags#references()<CR>
let g:which_key_map.t.l = 'list references (LSP or Tag)'

nnoremap <leader>tb :pop!<CR>
let g:which_key_map.t.b = 'back in tag history'

nnoremap <leader>ta :tag!<CR>
let g:which_key_map.t.a = 'forward in tag history'

nnoremap <leader>th :tags<CR>
let g:which_key_map.t.h = 'history selection of tags'

nnoremap <leader>tt :TagbarOpen fj<CR>
let g:which_key_map.t.t = 'show tag in outline window (opens it if not already)'

nnoremap <leader>tl :tselect <C-R><C-W><CR>
let g:which_key_map.t.l = 'list of matching tags for word under cursor'

" Open next/previous match.
nnoremap <leader>t* :tnext<CR>
let g:which_key_map.t['*'] = 'goto next matching tag'

nnoremap <leader>t# :tprevious<CR>
let g:which_key_map.t['#'] = 'goto previous matching tag'

nnoremap <leader>tn :ptnext<CR>
let g:which_key_map.t.n = 'preview next matching tag'

nnoremap <leader>tN :ptprevious<CR>
let g:which_key_map.t.n = 'preview previous matching tag'

" Open the match shown in the current preview window.
nnoremap <silent> <leader>tO :<C-u> call utils#tags#open_preview_match()<CR>
let g:which_key_map.t.O = 'open previewed tag in current window'

nnoremap <leader>ts :Denite outline<CR>
let g:which_key_map.t.s = 'open Denite tag filter'
