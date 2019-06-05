scriptencoding utf-8

" Move lines/selection and auto indent
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" Indent visual selection multiple times.
vnoremap < <gv
vnoremap > >gv

" Insert new line below or above without go into insert mode.
nnoremap go o<esc>
nnoremap gO O<esc>

" German umlaut characters on a English keyboard layout.
" Lead to quick drawing delays on typing vocals, cause Vim have to check if
" one of this mappings follows. But it is only a visual affect, which
" shouldn't bother, especially when typing fast.
inoremap aee ä
inoremap Aee Ä
inoremap oee ö
inoremap Oee Ö
inoremap uee ü
inoremap Uee Ü
inoremap sss ß

" Make macros accessible in select mode as in normal mode.
xnoremap <expr> @ ":norm @" . nr2char(getchar()) . "<CR>"

" Use concealed drop down menu for spell correction in normal mode as in
" insert mode.
nnoremap z= ea<C-x><C-s>


" Splitjoin plugin mappings.
nnoremap gJ :SplitjoinJoin<CR>
nnoremap gS :SplitjoinSplit<CR>

" Toggle list characters.
nnoremap g. :<C-u>set list!<CR>
