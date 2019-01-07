let g:far#source = 'rg'
let g:far#auto_preview = 1
let g:far#result_preview = 1
let g:far#highlight_match = 1
let g:far#window_layout = 'right'
let g:far#preview_window_layout = 'top'
let g:far#preview_window_scroll_step = 3

" Mark that the following entries are based on `rg --type-list`.
let g:far#file_mask_favorites = ['vim', 'python', 'js', 'java', 'markdown', 'json', 'c']

highlight FarSearchVal ctermbg=NONE ctermfg=197 guibg=NONE guifg=#ff005f cterm=NONE gui=NONE
highlight FarReplaceVal ctermbg=NONE ctermfg=191 guibg=NONE guifg=#f7ff5f cterm=NONE gui=NONE
highlight FarReplacedItem ctermbg=191 ctermfg=16 guibg=#f7ff5f guifg=#000000 cterm=NONE gui=NONE
highlight FarExcludedItem ctermbg=197 ctermfg=15 guibg=#ff005f guifg=#ffffff cterm=NONE gui=NONE
highlight FarPreviewMatch ctermbg=197 ctermfg=15 guibg=#ff005f guifg=#ffffff cterm=NONE gui=NONE
