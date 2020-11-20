scriptencoding utf-8

let g:signify_sign_show_count = 1
let g:signify_priority = 1 " Allow to get overwritten by errors etc.

let g:signify_sign_add = ''
let g:signify_sign_change= ''
let g:signify_sign_delete= ''
let g:signify_sign_delete_first_line = g:signify_sign_delete


highlight! link SignifySignAdd           GreenBold
highlight! link SignifySignChange        BlueBold
highlight! link SignifySignDelete        RedBold
highlight! link SignifySignChangeDelete  PurpleBold
