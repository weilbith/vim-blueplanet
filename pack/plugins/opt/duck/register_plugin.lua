require('packer').use({
  'tamton-aquib/duck.nvim',
  module = 'duck',
  config = 'vim.cmd("packadd duck")',
})
