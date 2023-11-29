require('packer').use({
  'lewis6991/gitsigns.nvim',
  event = 'BufRead',
  config = 'vim.cmd("packadd gitsigns")',
})
