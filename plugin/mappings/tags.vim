if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.t = { 'name': '+tags' }


let g:which_key_map.t.d = 'jump to definition (LSP or Tag)'
nnoremap <leader>td <cmd>LspBacomp definitionProvider lua\ vim.lsp.buf.definition()
      \ execute\ 'tjump\ '.expand('<cword>')<CR>

let g:which_key_map.t.i = 'jump to implementation (LSP only)'
nnoremap <leader>ti <cmd>LspBacomp implementationProvider lua\ vim.lsp.buf.implementation()<CR>

let g:which_key_map.t.r = 'list references (LSP or Tag)'
nnoremap <leader>tr <cmd>LspBacomp referencesProvider Denite\ lsp_references
      \ execute\ 'tselect\ '.expand('<cword>')<CR>

" TODO: Use LsBacomp, but there is no check for type definition provider
let g:which_key_map.t.T = 'jump to type definition (LSP only)'
nnoremap <leader>tT <cmd>lua vim.lsp.buf.type_definition()

" TODO: Use LsBacomp, but there is no check for declaration provider
let g:which_key_map.t.D = 'jump to declaration (LSP only)'
nnoremap <leader>tD <cmd>lua vim.lsp.buf.declaration()

let g:which_key_map.t.s = 'filter and search by name for current buffer (LSP or Tag)'
nnoremap <leader>ts <cmd>LspBacomp documentSymbolProvider Denite\ lsp_symbols:document
      \ Denite\ outline<CR>

let g:which_key_map.t.S = 'filter and search by name for whole workspace (LSP)'
nnoremap <leader>tS <cmd>LspBacomp documentSymbolProvider Denite\ lsp_symbols:workspace<CR>

nnoremap <leader>tb :pop!<CR>
let g:which_key_map.t.b = 'back in tag history (Tag only)'

nnoremap <leader>ta :tag!<CR>
let g:which_key_map.t.a = 'forward in tag history (Tag only)'

nnoremap <leader>th :tags<CR>
let g:which_key_map.t.h = 'history selection of tags (Tag only)'

nnoremap <silent> <leader>tt :Vista show<CR>
let g:which_key_map.t.t = 'show tag in outline window (opens it if not already)'

nnoremap <leader>tn :tnext<CR>
let g:which_key_map.t['*'] = 'goto next matching tag (Tag only)'

nnoremap <leader>tN :tprevious<CR>
let g:which_key_map.t['#'] = 'goto previous matching tag (Tag only)'
