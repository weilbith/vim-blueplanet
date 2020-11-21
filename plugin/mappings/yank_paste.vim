if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.y = { 'name': '+yank' }


xnoremap <C-c> "+y
nnoremap <silent> <C-v> :set paste<CR>"+p:set nopaste<CR>

" Paste in visual mode from unnamed register does not overwrite it.
vnoremap <silent> p p:if v:register == '"'<Bar>let @@=@0<Bar>endif<cr>
