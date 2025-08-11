require('packer').use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    { 'nvim-tree/nvim-web-devicons', module = 'nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzy-native.nvim', module = 'telescope._extensions.fzy_native' },
  },
  opt = true,
})
