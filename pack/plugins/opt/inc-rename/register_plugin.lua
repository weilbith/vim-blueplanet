require('packer').use({
  'smjonas/inc-rename.nvim',
  module = 'inc_rename',
  config = 'vim.cmd("packadd inc-rename")',
})
