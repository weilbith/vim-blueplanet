if !exists('b:undo_ftplugin')
  let b:undo_ftplugin = ''
endif

nnoremap <buffer> <silent> <leader>to :<C-u>call jedi#goto()<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <leader>to'

nnoremap <buffer> <silent> <leader>tl :<C-u>call jedi#usages()<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <leader>tl'

nnoremap <buffer> <silent> <leader>rr viwy:<C-u>call jedi#rename()<CR><C-r>0
let b:undo_ftplugin .= '|nunmap <buffer> <leader>rr'

nnoremap <buffer> <silent> K :<C-u>call jedi#show_documentation()<CR>
let b:undo_ftplugin .= '|nunmap <buffer> K'
