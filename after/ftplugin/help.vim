" Goto next/previous tag from current cursor position.
nnoremap <buffer> <silent><leader>tn :<C-u>call search('<Bar>[^ <Bar>]\+<Bar>\<Bar>''[A-Za-z0-9_-]\{2,}''')<CR>
let b:undo_ftplugin .= '|nunmap <buffer> <leader>tn'

nnoremap <buffer> <silent> <leader>tp :<C-u>call search('<Bar>[^ <Bar>]\+<Bar>\<Bar>''[A-Za-z0-9_-]\{2,}''','b')<cr>
let b:undo_ftplugin .= '|nunmap <buffer> <leader>tp'
