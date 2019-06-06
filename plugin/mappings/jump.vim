" Jump for- and backward in the windows history.
call submode#enter_with('Jump', 'n', '', '<space>jn', '<C-I>')
call submode#enter_with('Jump', 'n', '', '<space>jN', '<C-O>')
call submode#map('Jump', 'n', '', 'n', '<C-I>')
call submode#map('Jump', 'n', '', 'N', '<C-O>')

" Show jump history.
nnoremap <silent> <leader>jh :<C-u>call utils#jump#jump_by_history()<CR>
