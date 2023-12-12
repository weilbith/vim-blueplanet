require('packer').use({
  'danymat/neogen',
  requires = { 'nvim-treesitter/nvim-treesitter' },
  cmd = 'Neogen',
})
