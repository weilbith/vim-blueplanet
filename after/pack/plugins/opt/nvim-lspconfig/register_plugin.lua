require('packer').use({
  'neovim/nvim-lspconfig',
  config = 'vim.cmd("packadd nvim-lspconfig")',
})
