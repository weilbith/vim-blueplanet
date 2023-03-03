require('packer').use({
  'mfussenegger/nvim-treehopper',
  module = 'tsht',
  config = 'vim.cmd("packadd treehopper")',
})
