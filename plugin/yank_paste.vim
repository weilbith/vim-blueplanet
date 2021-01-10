" Paste in visual mode from unnamed register does not overwrite it.
vnoremap <silent> p p:if v:register == '"'<Bar>let @@=@0<Bar>endif<cr>

augroup YankPaste
  autocmd!
  autocmd TextYankPost * silent! lua require('vim.highlight').on_yank()
augroup END
