require('packer').use({
  'theHamsta/nvim-dap-virtual-text',
  requires = 'nvim-treesitter/nvim-treesitter',
  after = 'nvim-dap',
  config = 'vim.cmd("packadd dap-virtual-text")',
})
