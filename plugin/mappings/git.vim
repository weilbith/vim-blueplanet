if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.g = { 'name': '+git' }

nnoremap <silent> <leader>gs :Gstatus<CR>
let g:which_key_map.g.s = 'open git status window'

nnoremap <silent> <leader>gp :Git push<CR> " SSH key password request does not work with Gpush
let g:which_key_map.g.p = 'push to upstream branch'

nnoremap <silent> <leader>gP :Git push --force-with-lease<CR>
let g:which_key_map.g.P = 'force push to upstream branch'

nnoremap <silent> <silent> <leader>gd <cmd>call utils#git#toggleDiff()<CR>
let g:which_key_map.g.d = 'show diff of current file to HEAD'

nnoremap <silent> <silent> <leader>gl <cmd>call utils#git#toggleAgit('Agit')<CR>
let g:which_key_map.g.l= 'show git log in new tab'

nnoremap <silent> <silent> <leader>gL <cmd>call utils#git#toggleAgit('AgitFile')<CR>
let g:which_key_map.g.L = 'show git log for current file in new tab'

nnoremap <silent> <silent> <leader>gc <cmd>call utils#windows#switch_site_window({'open': 'Twiggy', 'close': 'Twiggy'})<CR>
let g:which_key_map.g.c = 'open git branch selection window (checkout)'

nnoremap <silent> <leader>gb <cmd>GitMessenger<CR>
let g:which_key_map.g.b = 'show git blame for current line in floating window'

nnoremap <silent> <leader>gB <cmd>Gblame<CR>
let g:which_key_map.g.B = 'show git blame for current file'
