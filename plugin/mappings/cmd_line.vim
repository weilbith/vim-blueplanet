" Move without arrow keys.
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Call fuzzy search by Denite for help automatically.
cnoremap <expr> he getcmdtype() ==# ':' && getcmdpos() == 1 ? 'Telescope help_tags<CR>' : 'he'
