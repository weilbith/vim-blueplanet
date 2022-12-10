require('packer').use({
  'andymass/vim-matchup',
  requires = 'nvim-treesitter/nvim-treesitter',
  event = 'VimEnter',
  config = 'vim.cmd("packadd matchup")',
})
