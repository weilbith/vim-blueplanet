" Mappings
imap <buffer> <silent> <CR> <Plug>(denite_filter_quit)<CR>
imap <buffer> <silent> <Esc> <Plug>(denite_filter_quit)
imap <buffer> <silent> <C-j> <Esc>ji
imap <buffer> <silent> <C-k> <Esc>ki

" Options
call deoplete#custom#buffer_option('auto_complete', v:false)
