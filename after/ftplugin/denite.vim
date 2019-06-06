map <buffer> <silent> <expr> <CR> denite#do_map('do_action')
map <buffer> <silent> <expr> Q denite#do_map('do_action', 'quickfix')
map <buffer> <silent> <expr> i denite#do_map('open_filter_buffer')
map <buffer> <silent> <expr> a denite#do_map('choose_action')
map <buffer> <silent> <expr> <Esc> denite#do_map('quit')
map <buffer> <silent> <expr> p denite#do_map('do_action', 'preview')
map <buffer> <silent> <expr> <Space> denite#do_map('toggle_select').'j'
