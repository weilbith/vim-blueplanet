require('packer').use({
  'nvim-treesitter/nvim-treesitter-refactor',
  module = 'nvim-treesitter-refactor',
  config = 'vim.cmd("packadd treesitter-refactor")',
})
