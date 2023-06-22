require('packer').use({
  'j-hui/fidget.nvim',
  branch = 'legacy',
  config = 'vim.cmd("packadd fidget")',
})
