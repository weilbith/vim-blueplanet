require('packer').use({
  'rachartier/tiny-code-action.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim', module = 'plenary' },
    { 'nvim-telescope/telescope.nvim', module = 'telescope' },
  },
  module = 'tiny-code-action',
})
