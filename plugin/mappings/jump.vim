" Jump for- and backward in the windows history.
call submode#enter_with('test', 'n', '', '<space>jn', '<C-I>')
call submode#enter_with('test', 'n', '', '<space>jp', '<C-O>')
call submode#map('test', 'n', '', 'n', '<C-I>')
call submode#map('test', 'n', '', 'p', '<C-O>')

" Show jump history.
nnoremap <silent> <leader>jh :<C-u>call utils#jump#jump_by_history()<CR>
