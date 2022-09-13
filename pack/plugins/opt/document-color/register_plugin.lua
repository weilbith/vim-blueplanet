require('packer').use({
  'mrshmllow/document-color.nvim',
  event = 'LspAttach',
  config = 'vim.cmd("packadd document-color")',
})
