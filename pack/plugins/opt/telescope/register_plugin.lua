require('packer').use({
  'nvim-telescope/telescope.nvim',
  requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },
  cmd = 'Telescope',
  module = 'telescope',
  config = 'vim.cmd("packadd telescope")',
})
