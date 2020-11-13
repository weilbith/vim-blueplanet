if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.t = { 'name': '+tags' }


let g:which_key_map.t.d = 'jump to (type) definition/declaration/implementation (LSP or Tag)'
nnoremap <leader>td <cmd>execute 'tjump ' . expand('<cword>')<CR>

let g:which_key_map.t.r = 'list references (LSP or Tag)'
nnoremap <leader>tr <cmd>Denite lsp_references<CR>

let g:which_key_map.t.f = 'filter and search by name for current buffer (LSP or Tag)'
nnoremap <leader>tf <cmd>Denite -start-filter lsp_symbols:document<CR>

let g:which_key_map.t.F = 'filter and search by name for whole workspace (LSP)'
nnoremap <leader>tF <cmd>Denite -start-filter lsp_symbols:workspace<CR>

nnoremap <silent> <leader>tt :Vista show<CR>
let g:which_key_map.t.t = 'show tag in outline window (opens it if not already)'

nnoremap <leader>]t <cmd>tnext<CR>
nnoremap <leader>[t <cmd>tprevious<CR>
