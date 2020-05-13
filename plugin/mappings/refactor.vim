if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.r = { 'name': '+refactor' }


" TODO: the provider is not correct because not supported yet
nnoremap <silent> <leader>rr <cmd>LspBacomp definitionProvider lua\ vim.lsp.buf.rename()
      \ call\ utils#refactor#rename_via_substitution(expand(('<cword')))<CR>
let g:which_key_map.r.r = 'rename object under cursor (LSP or Substitue)'

vnoremap <silent> <leader>rr <cmd>call utils#refactor#rename_via_substitute(utils#msc#get_visual_selection())<CR>

nnoremap <leader>rR <cmd>Farp<CR>
let g:which_key_map.r.R = 'trigger substitution for whole project with control (opens control window)'

vnoremap <leader>rR <cmd>Farp<CR>

nnoremap <leader>rd <cmd>Fardo<CR>
let g:which_key_map.r.d = 'apply triggered and controlled substitution'

nnoremap <leader>ru <cmd>Farundo<CR>
let g:which_key_map.r.u = 'undo last applied substituation'
