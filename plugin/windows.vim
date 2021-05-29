nnoremap <leader>ws <cmd>split<CR>
nnoremap <leader>wv <cmd>vsplit<CR>
nnoremap <leader>wc <cmd>close<CR>

nnoremap <leader>wh <cmd>wincmd h<CR>
nnoremap <leader>wj <cmd>wincmd j<CR>
nnoremap <leader>wk <cmd>wincmd k<CR>
nnoremap <leader>wl <cmd>wincmd l<CR>

nnoremap <leader>wH <cmd>wincmd H<CR>
nnoremap <leader>wJ <cmd>wincmd J<CR>
nnoremap <leader>wK <cmd>wincmd K<CR>
nnoremap <leader>wL <cmd>wincmd L<CR>

nnoremap <leader>wP <cmd>wincmd P<CR>
nnoremap <leader>wz <cmd>wincmd z<CR>

nnoremap <leader>w1 <cmd>1wincmd w<CR>
nnoremap <leader>w2 <cmd>2wincmd w<CR>
nnoremap <leader>w3 <cmd>3wincmd w<CR>
nnoremap <leader>w4 <cmd>4wincmd w<CR>
nnoremap <leader>w5 <cmd>5wincmd w<CR>
nnoremap <leader>w6 <cmd>6wincmd w<CR>
nnoremap <leader>w7 <cmd>7wincmd w<CR>
nnoremap <leader>w8 <cmd>8wincmd w<CR>
nnoremap <leader>w9 <cmd>9wincmd w<CR>

nnoremap <leader>wrh <C-w><
nnoremap <leader>wrj <C-w>-
nnoremap <leader>wrk <C-w>+
nnoremap <leader>wrl <C-w>>

" Gets extended by a couple of plugin specific mappings.

augroup Windows
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END
