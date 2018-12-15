" Quit all buffers and windows without save anything.
nnoremap <leader>Zz :qa!<CR>

" Quit as above, but save all buffers before.
nnoremap <leader>Zs :xa<CR>

" Quit, save all buffers and save session. (use the vim-session plugin)
nnoremap <leader>ZS :SaveSession!<CR>:xa<CR>
