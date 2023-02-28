require('packer').use({
  'mfussenegger/nvim-dap',
  requires = { 'mxsdev/nvim-dap-vscode-js' },
  module = 'dap',
  config = 'vim.cmd("packadd dap")',
})
