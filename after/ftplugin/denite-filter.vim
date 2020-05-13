" Mappings
" Don't use inoremap, since this will not work properly
imap <buffer> <silent> <CR> <Plug>(denite_filter_quit)<CR>
imap <buffer> <silent> <Esc> <Plug>(denite_filter_quit)
imap <buffer> <silent> <Tab> <Plug>(denite_filter_quit)ji
imap <buffer> <silent> <S-Tab> <Plug>(denite_filter_quit)ki
