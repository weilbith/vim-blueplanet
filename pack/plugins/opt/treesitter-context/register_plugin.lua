require('packer').use({
  'romgrk/nvim-treesitter-context',
  after = 'nvim-treesitter',
  config = 'vim.cmd("packadd treesitter-context")',
})
