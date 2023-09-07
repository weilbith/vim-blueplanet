require('packer').use({
  'Bekaboo/dropbar.nvim',
  requires = {
    { 'nvim-tree/nvim-web-devicons', module = 'nvim-web-devicons' },
  },
  config = 'vim.cmd("packadd dropbar")',
})
