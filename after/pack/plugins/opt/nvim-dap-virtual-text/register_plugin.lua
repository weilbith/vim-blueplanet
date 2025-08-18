require('packer').use({
  'theHamsta/nvim-dap-virtual-text',
  requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
  after = 'nvim-dap',
})
