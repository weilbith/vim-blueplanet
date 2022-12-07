require('packer').use({
  'sindrets/diffview.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  config = 'vim.cmd("packadd diffview")',
})
