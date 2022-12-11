require('packer').use({
  'cbochs/portal.nvim',
  module = 'portal',
  config = 'vim.cmd("packadd portal")',
})
