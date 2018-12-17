scriptencoding utf-8

let g:signify_vcs_list = ['git','svn']
let g:signify_line_highlight = 0
let g:signify_sign_show_count = 1

" Signs
let g:signify_sign_add = ''
let g:signify_sign_change= ''
let g:signify_sign_delete= '✗'
let g:signify_sign_delete_first_line = g:signify_sign_delete

" Highlighting
highlight SignifySignAdd    ctermfg=191 guifg=#d7ff5f ctermbg=234 guibg=#1c1c1c cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=214 guifg=#f5bb12 ctermbg=234 guibg=#1c1c1c cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=197 guifg=#ff005f ctermbg=234 guibg=#1c1c1c cterm=NONE gui=NONE
" The rest is linked per default.

highlight LineifyLineAdd    ctermfg=NONE guifg=NONE ctermbg=191 guibg=#d7ff5f cterm=NONE gui=NONE
highlight LineifyLineChange ctermfg=NONE guifg=NONE ctermbg=214 guibg=#f5bb12 cterm=NONE gui=NONE
highlight LineifyLineDelete ctermfg=NONE guifg=NONE ctermbg=197 guibg=#ff005f cterm=NONE gui=NONE
" The rest is linked per default.
