" Quick save current buffer without have to use command line.
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>

" Save as sudo (only for unix)
if !has("win32")
  nnoremap <C-s>s :w !sudo tee > /dev/null %<CR>
endif
