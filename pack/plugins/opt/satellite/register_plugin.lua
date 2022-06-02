require('packer').use({
  'lewis6991/satellite.nvim',
  event = 'BufRead',
  config = 'vim.cmd("packadd satellite")',
})
