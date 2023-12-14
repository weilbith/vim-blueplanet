require('packer').use({
  'mfussenegger/nvim-treehopper',
  requires = { 'phaazon/hop.nvim', module = 'hop' },
  module = 'tsht',
})
