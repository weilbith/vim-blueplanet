" Disable the arrow keys.
" Not possible for the command line, cause the mappings for moving the cursor
" point to this keys.
" Normal Mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Insert Mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Visual Mode
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

" Disable entering the ex-mode.
nnoremap Q <nop>

" Remove the update fold mapping by plugin FastFold.
nmap <SID>(DisableFastFoldUpdate) <Plug>(FastFoldUpdate)
