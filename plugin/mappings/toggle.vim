if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.y = { 'name': '+yank' }


nnoremap <silent> <F2> <cmd>call utils#windows#switch_site_window({'open': 'NERDTreeToggle', 'close': 'NERDTreeToggle'})<CR>
let g:which_key_map['<F2>'] = 'toggle file tree window on left window switch'

nnoremap <silent> <F3> <cmd>call plugin#vista#toggle()<CR>
let g:which_key_map['<F3>'] = 'toggle outline window'

nnoremap <silent> <F4> <cmd>call utils#windows#switch_site_window({'open': 'TMToggle', 'close': 'TMToggle'})<CR>
let g:which_key_map['<F4>'] = 'toggle tab manager window on left window switch'

nnoremap <silent> <S-u> <cmd>call utils#windows#switch_site_window({'open': 'UndotreeShow', 'close': 'UndotreeHide'})<CR>
let g:which_key_map.U = 'toggle undo history window on left window switch'
