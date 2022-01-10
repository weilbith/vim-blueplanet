packer.use({
  'abecodes/tabout.nvim',
  wants = { 'nvim-treesitter' },
  keys = {{ 'i', '<Plug>(Tabout)' }},
  config = 'vim.cmd("packadd tabout")',
})
