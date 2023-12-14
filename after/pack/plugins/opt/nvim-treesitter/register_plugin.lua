require('packer').use({
  'nvim-treesitter/nvim-treesitter',
  run = 'vim.cmd("TSUpdate")',
  config = 'vim.cmd("packadd nvim-treesitter")',
})
