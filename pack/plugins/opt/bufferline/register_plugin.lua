require('packer').use({
  'akinsho/bufferline.nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = 'vim.cmd("packadd bufferline")',
})
