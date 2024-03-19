require('packer').use({
  'rcarriga/nvim-dap-ui',
  requires = {
    { 'mfussenegger/nvim-dap', module = 'dap' },
    { 'nvim-neotest/nvim-nio', module = 'nio' },
  },
  after = 'nvim-dap',
})
