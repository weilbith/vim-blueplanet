require('packer').use({
  'neovim/nvim-lspconfig',
  requires = 'b0o/SchemaStore.nvim',
  config = 'vim.cmd("packadd lspconfig")',
})
