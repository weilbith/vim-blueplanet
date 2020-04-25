if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.t = { 'name': '+tags' }


nnoremap <leader>td <cmd>call utils#tags#definition()<CR>
let g:which_key_map.t.o = 'jump to definition (LSP or Tag)'

nnoremap <leader>ti <cmd>call utils#tags#implementation()<CR>
let g:which_key_map.t.i = 'jump to implementation (LSP only)'

nnoremap <leader>tr <cmd>call utils#tags#references()<CR>
let g:which_key_map.t.l = 'list references (LSP or Tag)'

nnoremap <leader>tT <cmd>call utils#tags#type_definition()<CR>
let g:which_key_map.t.T = 'jump to type definition (LSP only)'

nnoremap <leader>tD <cmd>call utils#tags#declaration()<CR>
let g:which_key_map.t.d = 'jump to declaration (LSP only)'

nnoremap <leader>ts :Denite outline<CR>
let g:which_key_map.t.s = 'filter and search by name (LSP or Tag)'

" TODO: Peek definition is no LSP command, need plugin
" nnoremap <leader>tp <cmd>call utils#tags#preview()<CR>
" let g:which_key_map.t.p = 'preview definition (LSP or Tag)'

nnoremap <leader>tb :pop!<CR>
let g:which_key_map.t.b = 'back in tag history'

nnoremap <leader>ta :tag!<CR>
let g:which_key_map.t.a = 'forward in tag history'

nnoremap <leader>th :tags<CR>
let g:which_key_map.t.h = 'history selection of tags'

nnoremap <silent> <leader>tt :Vista show<CR>
let g:which_key_map.t.t = 'show tag in outline window (opens it if not already)'

" Open next/previous match.
nnoremap <leader>tn :tnext<CR>
let g:which_key_map.t['*'] = 'goto next matching tag'

nnoremap <leader>tN :tprevious<CR>
let g:which_key_map.t['#'] = 'goto previous matching tag'
