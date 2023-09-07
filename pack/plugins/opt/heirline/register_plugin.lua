require('packer').use({
  'rebelot/heirline.nvim',
  event = 'VimEnter',
  config = 'vim.cmd("packadd heirline")',
})
