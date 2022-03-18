require('packer').use({
  'neovim/nvim-lspconfig',
  config = 'vim.cmd("packadd lspconfig")',
})
