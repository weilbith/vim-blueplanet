packer.use({
  'lewis6991/gitsigns.nvim',
  requires = 'nvim-lua/plenary.nvim',
  event = 'BufRead',
  config = 'vim.cmd("packadd gitsigns")',
})
