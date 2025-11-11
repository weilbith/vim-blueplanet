require('packer').use({
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  run = vim.cmdTSUpdate,
})
