if !exists('g:which_key_map') | let g:which_key_map = {} | endif
let g:which_key_map.y = { 'name': '+yank' }


nnoremap <silent> <F2> <cmd>NERDTreeToggle<CR>
let g:which_key_map['<F2>'] = 'toggle file tree window'

nnoremap <silent> <F3> <cmd>call plugin#vista#toggle()<CR>
let g:which_key_map['<F3>'] = 'toggle outline window'

nnoremap <silent> <S-u> <cmd>UndotreeShow<CR>
let g:which_key_map.U = 'toggle undo history window'
