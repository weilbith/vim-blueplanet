require('packer').use({
  'rachartier/tiny-code-action.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope.nvim', opt = true },
  },
})
