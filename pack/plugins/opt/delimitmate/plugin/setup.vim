let g:delimitMate_autoclose = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_balance_matchpairs = 1

autocmd FileType markdown let b:delimitMate_nesting_quotes = ['`']
let &filetype = &filetype " Re-trigger filetype event
