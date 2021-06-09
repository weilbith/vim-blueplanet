vim.cmd("packadd plugin_manager") -- Must be sourced before all other start packages

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.cmd("syntax on")

vim.opt.encoding = 'utf-8'
vim.opt.spell = false -- TODO: treesitter is annoying atm.
-- vim.o.spellfile = vim.fn.stdpath('data') .. '/spell/en.utf-8.add'
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'c'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.formatoptions = 'j1cql'
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.whichwrap = 'b,s,h,l'
vim.opt.showmode = false
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.shortmess = vim.o.shortmess .. 'c'
vim.opt.showmatch = true
vim.opt.scrolloff = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.o.viminfo = '100,n' .. vim.fn.stdpath('data') .. '/files/info/viminfo'
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 1000
vim.opt.updatecount = 0
vim.opt.foldlevel = 1
vim.opt.foldcolumn = 'auto:5'
vim.opt.hidden = true
-- vim.o.lazyredraw = true
vim.opt.pumheight = 30
-- vim.o.showtabline = 2
vim.opt.joinspaces = false
vim.opt.inccommand = 'split'
vim.opt.fillchars = 'vert:█,diff:█,fold:⎯,foldclose:,foldopen:,foldsep:│'
vim.opt.listchars = 'eol:﬋,tab:ﲒ,space:.,trail:.,extends:ﰣ,precedes:﬌,nbsp:.'
vim.opt.diffopt = 'internal,filler,closeoff,vertical,context:3,algorithm:patience'
vim.opt.viewoptions = 'cursor,folds,slash,unix'
-- vim.opt.netrw_home = vim.fn.stdpath('data') .. '/netrwhist'
