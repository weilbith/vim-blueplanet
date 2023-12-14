require('packer').use({
  'nvim-treesitter/nvim-treesitter-textobjects',
  after = 'nvim-treesitter',
  config = 'vim.cmd("packadd nvim-treesitter-textobjects")',
})
