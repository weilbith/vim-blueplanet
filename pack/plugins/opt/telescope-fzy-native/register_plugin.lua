require('packer').use({
  'nvim-telescope/telescope-fzy-native.nvim',
  after = 'telescope.nvim',
  config = 'vim.cmd("packadd telescope-fzy-native")',
})
