require('packer').use({
  'neovim/nvim-lspconfig',
  requires = { 'b0o/SchemaStore.nvim', module = 'schemastore' },
  config = 'vim.cmd("packadd nvim-lspconfig")',
})
