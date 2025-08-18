require('packer').use({
  'tobias-z/java-util.nvim',
  requires = {
    { 'nvim-treesitter/nvim-treesitter', opt = true },
    { 'nvim-lua/plenary.nvim', opt = true },
  },
  opt = true,
})
