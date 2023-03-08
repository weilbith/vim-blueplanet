require('packer').use({
  'rcarriga/nvim-dap-ui',
  requires = 'mfussenegger/nvim-dap',
  after = 'nvim-dap',
  config = 'vim.cmd("packadd dap-ui")',
})
