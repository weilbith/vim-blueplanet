scriptencoding utf-8

" Global source options.
let g:deoplete#sources#jedi#enable_typeinfo = 1
let g:deoplete#sources#jedi#show_docstring = 0
let g:deoplete#sources#jedi#statement_length = 100

" Set custom source options.
call deoplete#custom#source('jedi', 'rank', 700)
call deoplete#custom#source('jedi', 'filetypes', ['python'])
call deoplete#custom#source('jedi', 'mark', '')
