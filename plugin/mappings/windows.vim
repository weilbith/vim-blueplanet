" Split new window
nnoremap <silent> <leader>ws :split<CR>
nnoremap <silent> <leader>wv :vsplit<CR>

" Close window (active one or selection)
nnoremap <silent> <leader>wc :close<CR>
nnoremap <silent> <leader>wC :ChooseWin \| close<CR>

" Jump to/close preview window
nnoremap <silent> <leader>wp :wincmd p<CR>
nnoremap <silent> <leader>wz :wincmd z<CR>

" Jump back to last window.
nnoremap <silent> <leader>wb :wincmd p<CR>

" Choose a window (use the ChooseWin plugin).
nnoremap <silent> <leader>ww :ChooseWin<CR>

" Jump between windows of a split layout.
nnoremap <silent> <leader>wh :<C-u>call utils#windows#jump('h')<CR>
nnoremap <silent> <leader>wj :<C-u>call utils#windows#jump('j')<CR>
nnoremap <silent> <leader>wk :<C-u>call utils#windows#jump('k')<CR>
nnoremap <silent> <leader>wl :<C-u>call utils#windows#jump('l')<CR>

" By id (works nice with the airline section for the window id)
nnoremap <silent> <leader>w1 :1wincmd w<CR>
nnoremap <silent> <leader>w2 :2wincmd w<CR>
nnoremap <silent> <leader>w3 :3wincmd w<CR>
nnoremap <silent> <leader>w4 :4wincmd w<CR>
nnoremap <silent> <leader>w5 :5wincmd w<CR>
nnoremap <silent> <leader>w6 :6wincmd w<CR>
nnoremap <silent> <leader>w7 :7wincmd w<CR>
nnoremap <silent> <leader>w8 :8wincmd w<CR>
nnoremap <silent> <leader>w9 :9wincmd w<CR>

" Resize active window.
let s:resize_big_step = 5
" In-/Decrease width/height by using submode (submodes plugin required)
call submode#enter_with('resize', 'n', '', '<space>wrh', '<C-w><')
call submode#enter_with('resize', 'n', '', '<space>wrj', '<C-w>-')
call submode#enter_with('resize', 'n', '', '<space>wrk', '<C-w>+')
call submode#enter_with('resize', 'n', '', '<space>wrl', '<C-w>>')

call submode#map('resize', 'n', '', 'h', '<C-w><')
call submode#map('resize', 'n', '', 'j', '<C-w>-')
call submode#map('resize', 'n', '', 'k', '<C-w>+')
call submode#map('resize', 'n', '', 'l', '<C-w>>')

call submode#map('resize', 'n', '', 'H', s:resize_big_step . '<C-w><')
call submode#map('resize', 'n', '', 'J', s:resize_big_step . '<C-w>-')
call submode#map('resize', 'n', '', 'K', s:resize_big_step . '<C-w>+')
call submode#map('resize', 'n', '', 'L', s:resize_big_step . '<C-w>>')


" In-/Decrease or set to fixed width/height by user input.
noremap <silent> <leader>wrH :<C-u>call utils#windows#windowChangeSize('height')<CR>
noremap <silent> <leader>wrW :<C-u>call utils#windows#windowChangeSize('width')<CR>

" Maximize current window (with Goyo plugin)
nnoremap <silent> <leader>wm :<C-u>call utils#windows#toggle_max_window()<CR>

" Move windows.
" Swap active window with a selected one.
nnoremap <leader>w<Tab> :ChooseWinSwap<CR>

" Move window to the edges.
nnoremap <silent> <leader>wH :wincmd H<CR>
nnoremap <silent> <leader>wJ :wincmd J<CR>
nnoremap <silent> <leader>wK :wincmd K<CR>
nnoremap <silent> <leader>wL :wincmd L<CR>

" Switch split layout.
nnoremap <silent> <leader>wS :<C-u>call utils#windows#switch_window_split(v:true)<CR>
nnoremap <silent> <leader>wV :<C-u>call utils#windows#switch_window_split(v:false)<CR>
