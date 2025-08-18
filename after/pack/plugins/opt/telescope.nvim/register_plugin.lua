require('packer').use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-tree/nvim-web-devicons', opt = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
  },
  opt = true,
})
