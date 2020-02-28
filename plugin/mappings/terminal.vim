if !exists('g:which_key_map_local') | let g:which_key_map_local = {} | endif
let g:which_key_map_local['t'] = { 'name': '+floaterm' }

nnoremap <silent> <localleader>to :<C-u>FloatermNew<CR>
tnoremap <silent> <localleader>to :<C-\><C-n>FloatermNew<CR>
let g:which_key_map_local['t'].o = 'open new floating terminal'

nnoremap <silent> <localleader>tt :<C-u>FloatermToggle<CR>
tnoremap <silent> <localleader>tt :<C-\><C-n>FloatermToggle<CR>
let g:which_key_map_local['t'].t = 'toggle floating terminal (create initial one if none exist)'

noremap <silent> <localleader>tn :<C-u>FloatermNext<CR>
tnoremap <silent> <localleader>tn :<C-\><C-n>FloatermNext<CR>
let g:which_key_map_local['t'].n = 'switch to next floating terminal'

