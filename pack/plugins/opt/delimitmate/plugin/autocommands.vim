augroup DelimitMateNesting
  autocmd!
  autocmd FileType markdown let b:delimitMate_nesting_quotes = ['`']
augroup END

let &filetype = &filetype " Re-trigger filetype event
