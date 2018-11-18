scriptencoding utf-8

let g:twiggy_local_branch_sort = 'date'
let g:twiggy_remote_branch_sort = 'date'
let g:twiggy_num_columns = 40
let g:twiggy_split_method = 'topleft'
let g:twiggy_close_on_fugitive_command = 1

" Signs
let g:twiggy_icons = ['', '✓', '↑', '↓', '↕', '∅', '✗']

" Disable spell check.
augroup Twiggy
  autocmd!
  autocmd BufNewFile branches setlocal nospell
augroup END
