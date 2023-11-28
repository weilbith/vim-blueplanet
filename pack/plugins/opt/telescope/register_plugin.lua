require('packer').use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    { 'nvim-tree/nvim-web-devicons', module = 'nvim-web-devicons' },
  },
  cmd = 'Telescope',
  module = 'telescope',
  config = 'vim.cmd("packadd telescope")',
})
