" Execute current buffer/selection.
nnoremap <leader>Qr <cmd>QuickRun<CR>
vnoremap <leader>Qr :QuickRun<CR>

" Jump to output window.
nnoremap <silent> <leader>Qw <cmd>call plugin#quickrun#goto()<CR>
nnoremap <silent> <leader>Qc <cmd>call plugin#quickrun#close()<CR>
