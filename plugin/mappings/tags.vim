if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.t = { 'name': '+tags' }


let g:which_key_map.t.d = 'jump to (type) definition/declaration/implementation (LSP or Tag)'
nnoremap <leader>td <cmd>execute 'tjump ' . expand('<cword>')<CR>

let g:which_key_map.t.r = 'list references'
nnoremap <leader>tr <cmd>Telescope lsp_references<CR>

let g:which_key_map.t.f = 'filter and search by name for current buffer'
nnoremap <leader>tf <cmd>Telescope lsp_document_symbols<CR>

let g:which_key_map.t.F = 'filter and search by name for whole workspace (LSP)'
nnoremap <leader>tF <cmd>Telescope lsp_workspace_symbols<CR>

nnoremap <silent> <leader>tt <cmd>Vista show<CR>
let g:which_key_map.t.t = 'show tag in outline window (opens it if not already)'

nnoremap <leader>]t <cmd>tnext<CR>
nnoremap <leader>[t <cmd>tprevious<CR>
