if !exists('g:which_key_map_local') | let g:which_key_map_local = {} | endif
let g:which_key_map_local['t'] = { 'name': '+testing' }

nnoremap <silent> <localleader>tt :<C-u>TestLast<CR>
let g:which_key_map_local['t'].t = 'run last executed test command'

nnoremap <silent> <localleader>tf :<C-u>TestFile<CR>
let g:which_key_map_local['t'].f = 'run tests of current buffer'

nnoremap <silent> <localleader>tn :<C-u>TestNearest<CR>
let g:which_key_map_local['t'].n = 'run test case closest to cursor'

nnoremap <silent> <localleader>ts :<C-u>TestSuite<CR>
let g:which_key_map_local['t'].s = 'run whole test suite'

nnoremap <silent> <localleader>to :<C-u>TestVisit<CR>
let g:which_key_map_local['t'].s = 'open last test run in current buffer'
