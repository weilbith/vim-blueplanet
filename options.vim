" Feature Enabling
set nocompatible
filetype plugin indent on
syntax enable


" Leaders
let g:mapleader = ' '
let g:maplocalleader = '\'


" Text
"" Encoding
set encoding=utf-8
set fileformat=unix
scriptencoding utf-8 " Awkward position, but must be.


"" Spelling
set spell
set spelllang=en_us
set spellfile=$XDG_DATA_HOME/nvim/spell/en.utf-8.add

" ---


" Appearance
set previewheight=10
set cursorline
set termguicolors
colorscheme sonokia

"" Fill Characters
set fillchars+=vert:│
set fillchars+=diff:⎯
set fillchars+=fold:⎯
set fillchars+=foldclose:
set fillchars+=foldopen:

"" Numbers
set number
set relativenumber

"" Concealing
set conceallevel=2
set concealcursor=c

"" Highlighting
set winhighlight=Normal:NormalActive,NormalNC:NormalInactive

" ---


" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
set shiftround

" ---


" Lines
set formatoptions=j1cql
set textwidth=80

"" Wrapping
set wrap
set linebreak
set whichwrap+=h,l

" ---


" Command-line
set noshowmode

"" Completion
set wildmenu
set wildmode=full
set wildignore=".git\*,.hg\*,.svn\*"
set completeopt=menuone,noinsert,noselect
set wildoptions=pum
set shortmess+=c

" ---


" Search
set showmatch
set incsearch
set hlsearch
set wrapscan
set scrolloff=2

"" Cases
set ignorecase
set smartcase

" ---


" Storage
set viminfo='100,n$XDG_DATA_HOME/nvim/files/info/viminfo

"" Backup
set backup
set backupdir=$XDG_DATA_HOME/nvim/files/backup/
set backupext=-vimbackup

"" Swap
set updatetime=1000 " Also swapping is not used anymore, this still affects the CursorHold event.
set directory^=$XDG_DATA_HOME/nvim/files/swap// " Put on top of the stash and use absolute paths (//), to avoid conflicts for files with the same name.
set updatecount=0 " Set to zero to don't use swapping, cause it lead to some problems and is not necessary (for me)

"" Undo
set undofile
set undodir=$XDG_DATA_HOME/nvim/files/undo/
set undolevels=100

" ---


" Folding
set foldmethod=marker
set foldlevel=0
set foldminlines=1
set foldcolumn=3

" ---


" Misc
set autoread
set hidden
set report=0
set lazyredraw
set viewoptions=cursor,folds,slash,unix
set pumheight=30
set showtabline=2
set nojoinspaces
set inccommand=split
execute 'set shell=' . (filereadable('/bin/zsh') ? '/bin/zsh' : 'bin/bash')

" List Characters
set nolist
set listchars=eol:﬋,tab:ﲒ,space:.,trail:.,extends:ﰣ,precedes:﬌,nbsp:.

" Expansion
set modelines=10
set history=200

" Notification
set noerrorbells
set novisualbell

"" VimDiff
set diffopt+=filler,vertical,context:3,algorithm:patience

" ---
