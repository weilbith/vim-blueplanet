require('packer').use({
  'rgroli/other.nvim',
  cmd = { 'Other', 'OtherVSplit' },
  config = 'vim.cmd("packadd other")',
})
