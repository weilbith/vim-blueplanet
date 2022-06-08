require('packer').use({
  'lewis6991/spellsitter.nvim',
  event = 'BufRead',
  config = 'vim.cmd("packadd spellsitter")',
})
