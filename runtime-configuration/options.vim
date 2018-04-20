set nocompatible
filetype plugin indent on

" Do not reset when reload runtime configuration a Vim instance.
if !exists("g:syntax_on")
    syntax enable
endif

" Set the encoding and file format to make this sure.
set encoding=utf-8
set fileformat=unix

" Increase the number of mod lines.
set modelines=10

" Design
colorscheme blue_planet
set fillchars+=vert:│

" Enable spell check per default.
set spell
set spelllang=en_us
set spellfile=$HOME/.vim/spell/en.utf-8.add

" Use the drop down menu for spell correction from the insert mode in normal mode.
nnoremap <Leader>s ea<C-X><C-S>

" Automatically update unchanged buffers, which files have been modified.
set autoread

" Set font for Glam
if has("gui_running")
  set guifont=UbuntuMonoDerivativePowerline_N:h11:cDEFAULT
end

" Start GUI maximized.
autocmd GUIEnter * simalt ~x

" Remove the menu and toolbar of GVim
set guioptions -=m
set guioptions -=T

" Remove scroll bars in GVim.
set guioptions -=r
set guioptions -=L

" Define the leaders.
let mapleader = " "
let maplocalleader = "\\"

" Extend the command line history.
set lazyredraw
set history=200

" Expand '%%' in the command line to the path of the active buffer.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
set shiftround

" Adjust autos completion for the command line.
set wildmenu
set wildmode=full
set wildignore+=.git\*,.hg\*,.svn\*

" Hide the mode information in the command line.
set noshowmode

" Allow free buffer switches without have to save changes.
set hidden

" Show line number and relative numbers
set nu
set relativenumber

" Wrap text to fit into the window.
set wrap

" Break lines nice after full words or sentences.
set linebreak

" Do not break long lines typed in insert mode by the user.
set nolist

" Disable the text width and use the wrap margin at the border.
set textwidth=0
set wrapmargin=5

" Allow left and right char navigation to jump to next line begin/end.
set whichwrap+=h,l

" Don't add comment character when hit '<enter>' (r) or 'o' (o).
set formatoptions-=ro

" Remove comment leader on join lines (j), broke not after single char words, but instead before (1).
set formatoptions+=j1


" Faster redrawing and only if necessary.
set ttyfast
set lazyredraw

" Always report changed lines.
set report=0

" Show matching parenthesis.
set showmatch

" No audible notifications.
set noerrorbells
set novisualbell

" Adjust the shells for GVim (windows) and vim in terminal (Unix).
if has("win32")
   set shell=cmd.exe " For working on MS-Windows
elseif if filereadable("/bin/zsh")
   set shell=/bin/zsh " Private use case
else
   set shell=/bin/bash " Fallback for servers without zsh
endif

" Let backspace behave like expected (delete over start of insertion and eol).
set backspace=2

" Mark the active window by adding some special options for it.
augroup CursorLine
  autocmd!
  " Cursor highlighting.
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END


" Storage
" Be aware, that all these specified folders here have to exist and are not created
" automatically.
" Backup
set backup
set backupdir=$HOME/.vim/files/backup/
set backupext=-vimbackup

" Swap
set updatetime=1000 " Also swapping is not used anymore, this still affects the CursorHold event.
set directory^=$HOME/.vim/files/swap// " Put on top of the stash and use absolute paths (//), to avoid conflicts for files with the same name.
set updatecount=0 " Set to zero to don't use swapping, cause it lead to some problems and is not necessary (for me)

" Undo
set undofile
set undodir=$HOME/.vim/files/undo/
set undolevels=100

" History
set viminfo='100,n$HOME/.vim/files/info/viminfo

" ---


" Searching
" Jump live to first result while typing.
set incsearch

" Highlight matching of search (and mapping to remove highlights)
set hlsearch
nnoremap <silent> <leader>/ :noh<cr>

" Case insensitive search when type lower case and sensitive when use any
" uppercase character.
set ignorecase
set smartcase

" When found last search result, jump to the beginning of the buffer.
set wrapscan

" Show at least two lines below or above the current search result.
set scrolloff=2

" Use current selection to search.
xnoremap <silent> * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap <silent> # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction"}}}
" ---


" Restore cursor position from last time editing opened file.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!  g'\"" | endif


" Height of the preview window.
set previewheight=10


" Folding
set foldmethod=marker
set foldlevel=0
set foldminlines=1 " Close folds always.
set foldclose=all " Always close folds when leave them.

" Use the fold column per default.
set foldcolumn=3

" For deoplete
set pyxversion=3

" For neosnippet
if has('conceal')
  set conceallevel=2
  set concealcursor=niv
endif


