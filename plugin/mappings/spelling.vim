if !exists('g:which_key_map') | let g:which_key_map = {} | endif
if !exists('g:which_key_map_local') | let g:which_key_map_local = {} | endif
if !exists('g:which_key_map.g') | let g:which_key_map.g = { 'name': '+special' } | endif
if !exists('g:which_key_map_local.g') | let g:which_key_map_local.g = { 'name': '+special' } | endif
let g:which_key_map.G = { 'name': '+grammar' }


" Call suggestions when move to next/previous bad word.
nnoremap [s [sea<C-X><C-S>
nnoremap ]s ]sea<C-X><C-S>

nmap <leader>Gg <cmd>GrammarousCheck<CR>
let g:which_key_map.G.g = 'start to check grammer'

nmap <leader>GR <Plug>(grammarous-reset)
let g:which_key_map.G.R = 'reset last grammar check'

nmap <leader>Go <Plug>(grammarous-open-info-window)
let g:which_key_map.G.o = 'open grammar check result window'

nmap <leader>Gc <Plug>(grammarous-close-info-window)
let g:which_key_map.G.c = 'close grammar check result window'

nmap <leader>Gn <Plug>(grammarous-move-to-next-error)
let g:which_key_map.G.n = 'jump to next grammar check error'

nmap <leader>GN <Plug>(grammarous-move-to-previous-error)
let g:which_key_map.G.N = 'jump to previous grammar check error'

nmap <leader>Gf <Plug>(grammarous-fixit)<Plug>(grammarous-move-to-next-error)
let g:which_key_map.G.f = 'autofix current error and jump to next'

nmap <leader>Gr <Plug>(grammarous-remove-error)<Plug>(grammarous-move-to-next-error)
let g:which_key_map.G.r = 'remove/ignore current error and jump to next'


nnoremap gt <cmd>Trans <C-r><C-w><CR>
let g:which_key_map.g.t = 'translate word under cursor (default language)'

nnoremap gT <cmd>TransSelectDirection<CR>
let g:which_key_map.g.t = 'translate word under cursor (select language)'

vnoremap gt :Trans<CR>
vnoremap gT :TransSelectDirection<CR>

nnoremap <localleader>gt <cmd>TransInteractive<CR>
let g:which_key_map_local.g.t = 'open interactive translation menu'
