require('packer').use({
  'rebelot/heirline.nvim',
  event = 'VimEnter',
  requires = {
    { 'Bekaboo/dropbar.nvim', module = 'dropbar' },
    { 'nvim-tree/nvim-web-devicons', module = 'nvim-web-devicons' },
  },
  config = 'vim.cmd("packadd heirline")',
})
