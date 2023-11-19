require('packer').use({
  'boltlessengineer/smart-tab.nvim',
  module = 'smart-tab',
  config = 'vim.cmd("packadd smart-tab")',
})
