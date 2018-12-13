" Select whole buffer visually (to copy it then).
nnoremap <C-a> ggVG

" Copy to clipboard from visual mode.
xnoremap <C-c> "+y

" Paste from clipboard with auto paste mode.
nnoremap <silent> <C-v> :set paste<CR>"+p:set nopaste<CR>

" Paste in visual mode from unnamed register does not overwrite it.
vnoremap <silent> p p:if v:register == '"'<Bar>let @@=@0<Bar>endif<cr>

" YankRing
" Insert number of history entry to paste.
nnoremap <silent> <leader>yy :<C-u>call utils#copy_paste#getYRElem()<CR>

" Circle through history
nnoremap <silent> <leader>yn :<C-u>YRReplace '1', P<CR>
nnoremap <silent> <leader>yp :<C-u>YRReplace '-1', P<CR>
