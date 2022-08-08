require('packer').use({
  'lvimuser/lsp-inlayhints.nvim',
  module = 'lsp-inlayhints',
  config = 'vim.cmd("packadd lsp-inlayhints")',
})
