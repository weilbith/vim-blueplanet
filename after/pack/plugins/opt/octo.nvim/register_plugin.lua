require('packer').use({
  'pwntester/octo.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope.nvim', opt = true },
  },
  opt = true,
})
