require('packer').use({
  'cbochs/portal.nvim',
  cmd = 'Portal',
  config = 'vim.cmd("packadd portal")',
})
