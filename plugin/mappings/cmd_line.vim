" Move without arrow keys.
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Call fuzzy search by Denite for help automatically.
cmap <expr> h getcmdtype() ==# ':' && getcmdpos() == 1 ? 'Denite help<CR>' : 'h'

" By mapping to the arrow keys, these can't be disabled.
" TODO: Find direct command to move in command line.
