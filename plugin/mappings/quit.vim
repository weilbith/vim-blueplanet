" Quit all buffers and windows without save anything.
nnoremap <leader>Qq :qa!<CR>

" Quit as above, but save all buffers before.
nnoremap <leader>Qs :xa<CR>

" Quit, save all buffers and save session. (use the vim-session plugin)
nnoremap <leader>QS :SaveSession!<CR>:xa<CR>
