vim.cmd("packadd plugin_manager") -- Must be sourced before all other start packages

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.cmd("syntax on")

vim.o.encoding = 'utf-8'
vim.wo.spell = false -- TODO: treesitter is annoying atm.
-- vim.o.spellfile = vim.fn.stdpath('data') .. '/spell/en.utf-8.add'
vim.wo.cursorline = true
vim.o.termguicolors = true
vim.wo.number = true
vim.wo.conceallevel = 2
vim.wo.concealcursor = 'c'
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.o.shiftround = true
vim.bo.formatoptions = 'j1cql'
vim.bo.textwidth = 80
vim.wo.linebreak = true
vim.o.whichwrap = 'b,s,h,l'
vim.o.showmode = false
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.showmatch = true
vim.o.scrolloff = 2
vim.o.ignorecase = true
vim.o.smartcase = true
-- vim.o.viminfo = '100,n' .. vim.fn.stdpath('data') .. '/files/info/viminfo'
vim.bo.swapfile = false
vim.bo.undofile = true
vim.o.updatetime = 1000
vim.o.updatecount = 0
vim.wo.foldlevel = 1
vim.wo.foldcolumn = 'auto:9'
vim.o.hidden = true
-- vim.o.lazyredraw = true
vim.o.pumheight = 30
-- vim.o.showtabline = 2
vim.o.joinspaces = false
vim.o.inccommand = 'split'
vim.o.fillchars = 'vert:█,diff:█,fold:⎯,foldclose:,foldopen:,foldsep:│'
vim.o.listchars = 'eol:﬋,tab:ﲒ,space:.,trail:.,extends:ﰣ,precedes:﬌,nbsp:.'
vim.o.diffopt = 'internal,filler,closeoff,vertical,context:3,algorithm:patience'
vim.o.viewoptions = 'cursor,folds,slash,unix'
vim.g.netrw_home = vim.fn.stdpath('data') .. '/netrwhist'
