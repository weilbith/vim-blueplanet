" Quick save current buffer without have to use command line.
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>

" Save with root permissions.
nnoremap <C-s>s :w !sudo tee > /dev/null %<CR>
