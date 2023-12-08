require('packer').use({
  'akinsho/bufferline.nvim',
  event = 'BufEnter',
  requires = { 'kyazdani42/nvim-web-devicons' },
})
