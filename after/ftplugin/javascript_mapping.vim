nnoremap <buffer> <silent> <leader>to :<C-u>TernDef<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <leader>to'

nnoremap <buffer> <silent> <leader>tp :<C-u>TernDefPreview<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <leader>tp'

nnoremap <buffer> <silent> <leader>tl :<C-u>TernRefs<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <leader>tl'

nnoremap <buffer> <silent> <leader>rr :<C-u>TernRename<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <leader>rr'

nnoremap <buffer> <silent> <localleader>t :<C-u>TernType<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <localleader>t'

nnoremap <buffer> <silent> K :<C-u>TernDoc<CR>
let b:undo_ftplugin .= '|nunmap <buffer> K'
