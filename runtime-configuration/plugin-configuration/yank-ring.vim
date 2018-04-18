let g:yankring_min_element_length = 2
let g:yankring_window_auto_close = 0
let g:yankring_history_dir = '$HOME/.vim/files'
let g:yankring_replace_n_pkey = '<leader>yp' " Unfortunately can't be defined in the mapping configurations
let g:yankring_replace_n_nkey = '<leader>yn' " Unfortunately can't be defined in the mapping configurations

" Use a fixed window height for the yank ring window.
autocmd BufNewFile * if @% == '[YankRing]' | set winfixheight | endif


" Has further mappings in the section toggle.
