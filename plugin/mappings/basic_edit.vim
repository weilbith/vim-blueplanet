scriptencoding utf-8

" Move lines/selection and auto indent
nnoremap <C-j> :move .+1<CR>==
nnoremap <C-k> :move .-2<CR>==

inoremap <C-j> <Esc>:move .+1<CR>==gi
inoremap <C-k> <Esc>:move .-2<CR>==gi

vnoremap <C-j> :move '>+1<CR>gv=gv
vnoremap <C-k> :move '<-2<CR>gv=gv


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


" Toggle list characters.
nnoremap g. <cmd>set list!<CR>

" Toggle info window for current buffer
nnoremap <silent> <C-g> <cmd>call plugin#info_window#toggle()<CR>

" Try to hover or use keyword program else
nnoremap K <cmd>LspBacomp hoverProvider lua\ vim.lsp.buf.hover()
      \ execute\ &keywordprg.'\ '.expand('<cword>')<CR>
