" Select whole buffer visually (to copy it then).
nnoremap <C-a> ggVG

" Copy to clipboard from visual mode.
xnoremap <C-c> "+y

" Paste from clipboard with auto paste mode.
nnoremap <silent> <C-v> :set paste<CR>"+p:set nopaste<CR>

" YankRing
" Insert number of YankRing to paste.
nnoremap <silent> <leader>yy :<C-u>call utils#copy_paste#getYRElem()<CR>

" Further mappings to circle trough YankRing entries must be defined in the
" plugin configuration itself.
