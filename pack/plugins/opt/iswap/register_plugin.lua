require('packer').use({
  'mizlan/iswap.nvim',
  cmd = { 'ISwap', 'ISwapWith' },
  config = 'vim.cmd("packadd iswap")',
})
