require('packer').use({
  'petertriho/nvim-scrollbar',
  event = 'BufRead',
  config = 'vim.cmd("packadd scrollbar")',
})
