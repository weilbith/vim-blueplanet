if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.y = { 'name': '+yank' }


xnoremap <C-c> "+y
nnoremap <silent> <C-v> :set paste<CR>"+p:set nopaste<CR>

" Paste in visual mode from unnamed register does not overwrite it.
vnoremap <silent> p p:if v:register == '"'<Bar>let @@=@0<Bar>endif<cr>

nnoremap <silent> <leader>yy <cmd>call utils#copy_paste#getYRElem()<CR>
let g:which_key_map.y.y = 'paste entry from yank history'

nnoremap <silent> <leader>yw <cmd>call utils#copy_paste#toggleYRShow()<CR>
let g:which_key_map.y.w = 'toggle yank history window'

nnoremap <silent> <leader>yn <cmd>YRReplace '1', P<CR>
let g:which_key_map.y.n = 'paste next yank history entry'

nnoremap <silent> <leader>yN <cmd>YRReplace '-1', P<CR>
let g:which_key_map.y.N = 'paste previous yank history entry'
