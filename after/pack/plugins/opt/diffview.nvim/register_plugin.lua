require('packer').use({
  'sindrets/diffview.nvim',
  requires = {
    { 'kyazdani42/nvim-web-devicons', module = 'nvim-web-devicons' },
  },
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
})
