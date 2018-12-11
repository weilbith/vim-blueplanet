" Goto next/previous tag from current cursor position.
nnoremap <silent><buffer> <leader>tn :<C-u>call search('<Bar>[^ <Bar>]\+<Bar>\<Bar>''[A-Za-z0-9_-]\{2,}''')<CR>
nnoremap <silent><buffer> <leader>tp :<C-u>call search('<Bar>[^ <Bar>]\+<Bar>\<Bar>''[A-Za-z0-9_-]\{2,}''','b')<cr>
