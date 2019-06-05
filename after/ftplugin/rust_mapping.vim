if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

nnoremap <buffer> <silent> <leader>to <plug>DeopleteRustGoToDefinitionDefault
let b:undo_ftplugin .= '|nunmap <buffer> <leader>to'

nnoremap <buffer> <silent> K <plug>DeopleteRustShowDocumentation
let b:undo_ftplugin .= '|nunmap <buffer> K'
