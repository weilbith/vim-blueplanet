require('packer').use({
  'Bekaboo/dropbar.nvim',
  event = 'VimEnter',
  requires = {
    { 'nvim-tree/nvim-web-devicons', module = 'nvim-web-devicons' },
  },
})
