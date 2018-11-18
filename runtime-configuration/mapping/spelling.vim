" Spelling
" Call suggestions when move to next/previous bad word.
nnoremap [s [sea<C-X><C-S>
nnoremap ]s ]sea<C-X><C-S>

" Grammar Plugin
" Start new check or reset current one.
nmap <leader>Gg :<C-u>GrammarousCheck<CR>
nmap <leader>GR <Plug>(grammarous-reset)

" Open or close info window.
nmap <leader>Go <Plug>(grammarous-open-info-window)
nmap <leader>Gc <Plug>(grammarous-close-info-window)

" Jump to next/previous error.
nmap <leader>Gn <Plug>(grammarous-move-to-next-error)
nmap <leader>GN <Plug>(grammarous-move-to-previous-error)

" Handle the current error.
nmap <leader>Gf <Plug>(grammarous-fixit)<Plug>(grammarous-move-to-next-error)
nmap <leader>Gr <Plug>(grammarous-remove-error)<Plug>(grammarous-move-to-next-error)
