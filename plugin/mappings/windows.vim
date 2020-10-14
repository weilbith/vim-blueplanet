if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.w = { 'name': '+windows' }
let g:which_key_map.w.r = { 'name': '+resize' }


nnoremap <silent> <leader>ws :split<CR>
let g:which_key_map.w.s = 'split window horizontal'

nnoremap <silent> <leader>wv :vsplit<CR>
let g:which_key_map.w.v = 'split window vertical'

nnoremap <silent> <leader>wc :close<CR>
let g:which_key_map.w.c = 'close current window'

nnoremap <silent> <leader>wC :ChooseWin \| close<CR>
let g:which_key_map.w.C = 'close window via selection'

nnoremap <silent> <leader>wp :wincmd P<CR>
let g:which_key_map.w.p = 'jump to preview window'

nnoremap <silent> <leader>wz :wincmd z<CR>
let g:which_key_map.w.z = 'close preview window'

nnoremap <silent> <leader>ww :ChooseWin<CR>
let g:which_key_map.w.w = 'jump to window via selection'

nnoremap <silent> <leader>wh <cmd>call utils#windows#jump('h')<CR>
nnoremap <silent> <leader>wj <cmd>call utils#windows#jump('j')<CR>
nnoremap <silent> <leader>wk <cmd>call utils#windows#jump('k')<CR>
nnoremap <silent> <leader>wl <cmd>call utils#windows#jump('l')<CR>
let g:which_key_map.w.h = 'which_key_ignore'
let g:which_key_map.w.j = 'which_key_ignore'
let g:which_key_map.w.k = 'which_key_ignore'
let g:which_key_map.w.l = 'which_key_ignore'
let g:which_key_map.w['hjkl'] = 'jump to relative left/bottom/top/right window'

nnoremap <silent> <leader>w1 :1wincmd w<CR>
nnoremap <silent> <leader>w2 :2wincmd w<CR>
nnoremap <silent> <leader>w3 :3wincmd w<CR>
nnoremap <silent> <leader>w4 :4wincmd w<CR>
nnoremap <silent> <leader>w5 :5wincmd w<CR>
nnoremap <silent> <leader>w6 :6wincmd w<CR>
nnoremap <silent> <leader>w7 :7wincmd w<CR>
nnoremap <silent> <leader>w8 :8wincmd w<CR>
nnoremap <silent> <leader>w9 :9wincmd w<CR>
let g:which_key_map.w.1 = 'which_key_ignore'
let g:which_key_map.w.2 = 'which_key_ignore'
let g:which_key_map.w.3 = 'which_key_ignore'
let g:which_key_map.w.4 = 'which_key_ignore'
let g:which_key_map.w.5 = 'which_key_ignore'
let g:which_key_map.w.6 = 'which_key_ignore'
let g:which_key_map.w.7 = 'which_key_ignore'
let g:which_key_map.w.8 = 'which_key_ignore'
let g:which_key_map.w.9 = 'which_key_ignore'
let g:which_key_map.w['1...9'] = 'jump to window by number'


" In-/Decrease width/height by using submode (submodes plugin required)
call submode#enter_with('Resize', 'n', '', '<space>wrh', '<C-w><')
call submode#enter_with('Resize', 'n', '', '<space>wrj', '<C-w>-')
call submode#enter_with('Resize', 'n', '', '<space>wrk', '<C-w>+')
call submode#enter_with('Resize', 'n', '', '<space>wrl', '<C-w>>')
let g:which_key_map.w.r.h = 'which_key_ignore'
let g:which_key_map.w.r.j = 'which_key_ignore'
let g:which_key_map.w.r.k = 'which_key_ignore'
let g:which_key_map.w.r.l = 'which_key_ignore'
let g:which_key_map.w.r['hjkl'] = 'increase/shrink window on left/bottom/top/left edge'

call submode#map('Resize', 'n', '', 'h', '<C-w><')
call submode#map('Resize', 'n', '', 'j', '<C-w>-')
call submode#map('Resize', 'n', '', 'k', '<C-w>+')
call submode#map('Resize', 'n', '', 'l', '<C-w>>')


let s:resize_big_step = 5

call submode#enter_with('Resize', 'n', '', '<space>wrH', '<C-w><')
call submode#enter_with('Resize', 'n', '', '<space>wrJ', '<C-w>-')
call submode#enter_with('Resize', 'n', '', '<space>wrK', '<C-w>+')
call submode#enter_with('Resize', 'n', '', '<space>wrL', '<C-w>>')
let g:which_key_map.w.r.H = 'which_key_ignore'
let g:which_key_map.w.r.J = 'which_key_ignore'
let g:which_key_map.w.r.K = 'which_key_ignore'
let g:which_key_map.w.r.L = 'which_key_ignore'
let g:which_key_map.w.r['HJKL'] = 'increase/shrink window on left/bottom/top/left edge (big steps)'

call submode#map('Resize', 'n', '', 'H', s:resize_big_step . '<C-w><')
call submode#map('Resize', 'n', '', 'J', s:resize_big_step . '<C-w>-')
call submode#map('Resize', 'n', '', 'K', s:resize_big_step . '<C-w>+')
call submode#map('Resize', 'n', '', 'L', s:resize_big_step . '<C-w>>')

noremap <silent> <leader>wrW <cmd>call utils#windows#windowChangeSize()<CR>
let g:which_key_map.w.r.W = 'increase/shrink/set window width/height by input'

nnoremap <leader>w<Tab> :ChooseWinSwap<CR>
let g:which_key_map.w['<Tab>'] = 'swap current window with window of selection'

nnoremap <silent> <leader>wH :wincmd H<CR>
nnoremap <silent> <leader>wJ :wincmd J<CR>
nnoremap <silent> <leader>wK :wincmd K<CR>
nnoremap <silent> <leader>wL :wincmd L<CR>
let g:which_key_map.w.H = 'which_key_ignore'
let g:which_key_map.w.J = 'which_key_ignore'
let g:which_key_map.w.K = 'which_key_ignore'
let g:which_key_map.w.L = 'which_key_ignore'
let g:which_key_map.w['HJWKL'] = 'move window to the left/bottom/top/right screen edge'

nnoremap <silent> <leader>wS <cmd>call utils#windows#switch_window_split(v:true)<CR>
let g:which_key_map.w.S = 'switch to horizontal split'

nnoremap <silent> <leader>wV <cmd>call utils#windows#switch_window_split(v:false)<CR>
let g:which_key_map.w.V = 'switch to vertical split'

nnoremap <silent> <leader>wf <cmd>call utils#layout#reset_fixed_windows()<CR>
let g:which_key_map.w.f = 'fix window layout'
