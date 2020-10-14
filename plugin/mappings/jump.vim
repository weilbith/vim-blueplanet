if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.j = { 'name': '+jump' }


call submode#enter_with('Jump', 'n', '', '<space>jn', '<C-I>')
let g:which_key_map.j.n = 'jump forward (enter Jump submode)'

call submode#enter_with('Jump', 'n', '', '<space>jN', '<C-O>')
let g:which_key_map.j.N = 'jump backward (enter Jump submode)'

call submode#map('Jump', 'n', '', 'n', '<C-I>')
call submode#map('Jump', 'n', '', 'N', '<C-O>')
