" Execute current buffer/selection.
nnoremap <leader>Qr :<C-u>QuickRun<CR>
vnoremap <leader>Qr :QuickRun<CR>

" Jump to output window.
nnoremap <silent> <leader>Qw :<C-u>call plugin#quickrun#goto()<CR>
nnoremap <silent> <leader>Qc :<C-u>call plugin#quickrun#close()<CR>
