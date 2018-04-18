let g:limelight_conceal_ctermfg = 272
let g:limelight_conceal_guifg = '#9e9e9e'
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1 " Don't overrule search highlights.

" Synchronize it with the goyo plugin.
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
