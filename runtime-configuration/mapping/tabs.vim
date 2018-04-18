" Open empty new tab.
nnoremap <leader>To :tabedit<CR>

" Open new tab with active buffer in it.
nnoremap <leader>Te :tabedit %<CR>

" Move between tabs.
nnoremap <leader>Tn :tabnext<CR>
nnoremap <leader>Tp :tabprevious<CR>

" Close current tab and close all visible buffers in it.
nnoremap <leader>Tc :windo bd!<bar>tabclose<CR>
