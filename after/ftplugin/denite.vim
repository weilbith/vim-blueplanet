" Use <expr> mappings always since <cmd> won't work
nnoremap <buffer> <silent> <expr> <CR> denite#do_map('do_action')
nnoremap <buffer> <silent> <expr> Q denite#do_map('do_action', 'quickfix')
nnoremap <buffer> <silent> <expr> i denite#do_map('open_filter_buffer')
nnoremap <buffer> <silent> <expr> a denite#do_map('choose_action')
nnoremap <buffer> <silent> <expr> <Esc> denite#do_map('quit')
nnoremap <buffer> <silent> <expr> p denite#do_map('do_action', 'preview')
nnoremap <buffer> <silent> <expr> <Space> denite#do_map('toggle_select').'j'
nnoremap <buffer> <silent> <expr> V denite#do_map('toggle_select_all')
nnoremap <buffer> <silent> <expr> q denite#do_map('do_action', 'quickfix')
