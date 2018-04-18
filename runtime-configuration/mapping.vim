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


" Edit/load vim runtime configuration.
nnoremap <leader>ve :e $HOME/.vimrc<CR>
nnoremap <leader>vl :source $HOME/.vimrc<CR>:echom "Vimrc reloaded!"<CR>


" Source special sections of mappings.
" Each following mapping is prefixed by the leader.
" Each section has its own/two character(s) which is followed after the
" leader for all their mappings.
source $HOME/.vim/runtime-configuration/mapping/buffers.vim       " b
source $HOME/.vim/runtime-configuration/mapping/search.vim        " s
source $HOME/.vim/runtime-configuration/mapping/files.vim         " f
source $HOME/.vim/runtime-configuration/mapping/git.vim           " g
source $HOME/.vim/runtime-configuration/mapping/quickfix.vim      " q
source $HOME/.vim/runtime-configuration/mapping/quit.vim          " Q
source $HOME/.vim/runtime-configuration/mapping/sessions.vim      " $
source $HOME/.vim/runtime-configuration/mapping/tabs.vim          " T
source $HOME/.vim/runtime-configuration/mapping/tags.vim          " t
source $HOME/.vim/runtime-configuration/mapping/windows.vim       " w
source $HOME/.vim/runtime-configuration/mapping/refactor.vim      " r


" Source mappings that are group but haven't a fixed character.
source $HOME/.vim/runtime-configuration/mapping/basic-edit.vim
source $HOME/.vim/runtime-configuration/mapping/cmd-line.vim
source $HOME/.vim/runtime-configuration/mapping/copy-paste.vim
source $HOME/.vim/runtime-configuration/mapping/save.vim
source $HOME/.vim/runtime-configuration/mapping/toggle.vim


" Further mappings for specific file types are in the 'ftplugin'
" directory of cause.
" They are using the local leader key as prefix, followed by a character that
" specify the language.
"
"    m - markdown
"


" Some prefixed are used for plugins by themself. 
"
"  c - nerd commener
"  double leader - easymotion
"  m - signature
