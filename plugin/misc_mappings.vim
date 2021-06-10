xnoremap <expr> @ ":norm @" . nr2char(getchar()) . "<CR>"
nnoremap z= ea<C-x><C-s>
nnoremap g. <cmd>set list!<CR>
nnoremap ZQ <cmd>confirm qall<CR>

" Because in web-browsers <C-W> closes the tab and I get crazy.
inoremap <C-BS> <C-\><C-o>db
