nnoremap <buffer> <silent> <expr> <CR> denite#do_map('do_action')
nnoremap <buffer> <silent> <expr> <Esc> denite#do_map('quit')
nnoremap <buffer> <silent> <expr> i denite#do_map('open_filter_buffer')
nnoremap <buffer> <silent> <expr> a denite#do_map('choose_action')
nnoremap <buffer> <silent> <expr> p denite#do_map('do_action', 'preview')
nnoremap <buffer> <silent> <expr> q denite#do_map('do_action', 'quickfix')
nnoremap <buffer> <silent> Q <cmd>call qfloc_denite#denite_do_action_quickfix_all()<CR>
nnoremap <buffer> <silent> <expr> l denite#do_map('do_action', 'location')
nnoremap <buffer> <silent> L <cmd>call qfloc_denite#denite_do_action_location_all()<CR>
nnoremap <buffer> <silent> <expr> v denite#do_map('toggle_select').'j'
nnoremap <buffer> <silent> <expr> V denite#do_map('toggle_select_all')
nnoremap <buffer> <silent> <expr> d denite#do_map('delete')
