packer.use({
  'lewis6991/spellsitter.nvim',
  requires = { 'nvim-treesitter/nvim-treesitter' },
  event = 'BufRead',
  config = 'vim.cmd("packadd spellsitter")',
})
