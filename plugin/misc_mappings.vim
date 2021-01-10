nnoremap <C-j> :move .+1<CR>==
vnoremap <C-j> :move '>+1<CR>gv=gv

nnoremap <C-k> :move .-2<CR>==
vnoremap <C-k> :move '<-2<CR>gv=gv

vnoremap < <gv
vnoremap > >gv

xnoremap <expr> @ ":norm @" . nr2char(getchar()) . "<CR>"
nnoremap z= ea<C-x><C-s>
nnoremap g. <cmd>set list!<CR>

nnoremap ZQ <cmd>confirm qall<CR>
