require('packer').use({
  'kevinhwang91/nvim-ufo',
  requires = 'kevinhwang91/promise-async',
  event = 'BufWinEnter',
  config = 'vim.cmd("packadd ufo")',
})
