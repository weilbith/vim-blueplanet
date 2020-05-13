if !exists('g:which_key_map_local') | let g:which_key_map_local = {} | endif
let g:which_key_map_local['T'] = { 'name': '+floaterm' }

nnoremap <silent> <localleader>To <cmd>FloatermNew<CR>
tnoremap <silent> <localleader>To :<C-\><C-n>FloatermNew<CR>
let g:which_key_map_local['T'].o = 'open new floating terminal'

nnoremap <silent> <localleader>Tt <cmd>FloatermToggle<CR>
tnoremap <silent> <localleader>Tt :<C-\><C-n>FloatermToggle<CR>
let g:which_key_map_local['T'].t = 'toggle floating terminal (create initial one if none exist)'

noremap <silent> <localleader>Tn <cmd>FloatermNext<CR>
tnoremap <silent> <localleader>Tn :<C-\><C-n>FloatermNext<CR>
let g:which_key_map_local['T'].n = 'switch to next floating terminal'
