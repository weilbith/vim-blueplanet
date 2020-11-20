let g:far#auto_preview = 1
let g:far#result_preview = 1
let g:far#highlight_match = 1
let g:far#window_layout = 'right'
let g:far#preview_window_layout = 'top'
let g:far#preview_window_scroll_step = 3
let g:far#file_mask_favorites = ['%', '**/*.*', '**/*.java', '**/*.cpp', '**/*.h',
      \ '**/*.c', '**/*.py', '**/*.js', '**/*.vue', '**/*.tex']

highlight! link FarSearchVal    RedBold
highlight! link FarReplaceVal   GreenBold
highlight! link FarReplacedItem GreenBackround
highlight! link FarExcludedItem RedBackground
highlight! link FarPreviewMatch RedBackground
