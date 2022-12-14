require('packer').use({
  'rebelot/heirline.nvim',
  event = 'VimEnter',
  requires = {
    'kyazdani42/nvim-web-devicons',
    { 'SmiteshP/nvim-gps', requires = 'nvim-treesitter/nvim-treesitter' },
  },
  config = 'vim.cmd("packadd heirline")',
})
