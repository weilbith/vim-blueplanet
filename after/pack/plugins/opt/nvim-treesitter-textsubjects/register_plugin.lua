require('packer').use({
  'RRethy/nvim-treesitter-textsubjects',
  after = 'nvim-treesitter',
  config = 'vim.cmd("packadd nvim-treesitter-textsubjects")',
})
