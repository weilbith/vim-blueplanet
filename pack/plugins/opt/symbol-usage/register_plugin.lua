require('packer').use({
  'Wansmer/symbol-usage.nvim',
  event = 'LspAttach',
  config = 'vim.cmd("packadd symbol-usage")',
})
