scriptencoding utf-8

let g:twiggy_local_branch_sort = 'date'
let g:twiggy_remote_branch_sort = 'date'
let g:twiggy_num_columns = 40
let g:twiggy_split_method = 'topleft'
let g:twiggy_refresh_buffers = 1
let g:twiggy_set_upstream = 1

" Signs
let g:twiggy_icons = ['', '✓', '↑', '↓', '↕', '∅', '✗']

" Disable spell check.
augroup Twiggy
  autocmd!

  " Disable spell to have origin colors.
  autocmd! Filetype twiggy setlocal nospell

  " Move window to most left and resize to correct width afterwards.
  autocmd! Filetype twiggy wincmd H |
        \ execute 'vertical resize ' . get(g:, 'twiggy_num_columns', 40)
augroup END
