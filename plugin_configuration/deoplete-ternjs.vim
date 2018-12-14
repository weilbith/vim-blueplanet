scriptencoding utf-8

let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 0
let g:deoplete#sources#ternjs#docs = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#filetypes = ['javascript', 'jsx', 'vue']

" Set custom source options.
call deoplete#custom#source('tern', 'rank', 700)
call deoplete#custom#source('tern', 'mark', '')
call deoplete#custom#source('tern', 'filetypes', ['javascript', 'jsx', 'vue'])
