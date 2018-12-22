" Choose color by dialog after selected an output format (vCoolor plugin needed)
nnoremap <silent> <A-c> :<C-u>call plugin#vcoolor#choose_color()<CR>
inoremap <silent> <A-c> <Esc>:<C-u>call plugin#vcoolor#choose_color()<CR>
