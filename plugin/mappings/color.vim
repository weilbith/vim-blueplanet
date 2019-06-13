" Choose color by dialog after selected an output format (vCoolor plugin needed)
nnoremap <silent> <M-c> :<C-u>call plugin#vcoolor#choose_color()<CR>
inoremap <silent> <M-c> <Esc>:<C-u>call plugin#vcoolor#choose_color()<CR>
