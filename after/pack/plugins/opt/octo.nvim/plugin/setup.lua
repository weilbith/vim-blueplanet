vim.cmd.packadd('plenary.nvim')
vim.cmd.packadd('telescope.nvim')

require('octo').setup()
require('telescope').load_extension('octo')
