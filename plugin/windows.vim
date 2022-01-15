nnoremap <unique> <leader>ws <cmd>split<CR>
nnoremap <unique> <leader>wv <cmd>vsplit<CR>
nnoremap <unique> <leader>wc <cmd>close<CR>

nnoremap <unique> <leader>wh <cmd>wincmd h<CR>
nnoremap <unique> <leader>wj <cmd>wincmd j<CR>
nnoremap <unique> <leader>wk <cmd>wincmd k<CR>
nnoremap <unique> <leader>wl <cmd>wincmd l<CR>

nnoremap <unique> <leader>wH <cmd>wincmd H<CR>
nnoremap <unique> <leader>wJ <cmd>wincmd J<CR>
nnoremap <unique> <leader>wK <cmd>wincmd K<CR>
nnoremap <unique> <leader>wL <cmd>wincmd L<CR>

nnoremap <unique> <leader>wP <cmd>wincmd P<CR>
nnoremap <unique> <leader>wz <cmd>wincmd z<CR>

nnoremap <unique> <leader>w1 <cmd>1wincmd w<CR>
nnoremap <unique> <leader>w2 <cmd>2wincmd w<CR>
nnoremap <unique> <leader>w3 <cmd>3wincmd w<CR>
nnoremap <unique> <leader>w4 <cmd>4wincmd w<CR>
nnoremap <unique> <leader>w5 <cmd>5wincmd w<CR>
nnoremap <unique> <leader>w6 <cmd>6wincmd w<CR>
nnoremap <unique> <leader>w7 <cmd>7wincmd w<CR>
nnoremap <unique> <leader>w8 <cmd>8wincmd w<CR>
nnoremap <unique> <leader>w9 <cmd>9wincmd w<CR>

nnoremap <unique> <leader>wrh <C-w><
nnoremap <unique> <leader>wrj <C-w>-
nnoremap <unique> <leader>wrk <C-w>+
nnoremap <unique> <leader>wrl <C-w>>

nnoremap <unique> <leader>wS <cmd>execute('wincmd c \| sbuffer ' . bufnr('%'))<CR>
nnoremap <unique> <leader>wV <cmd>execute('wincmd c \| vert sbuffer ' . bufnr('%'))<CR>

" Gets extended by a couple of plugin specific mappings.

augroup Windows
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END
