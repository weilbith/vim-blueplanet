require('packer').use({
  'zbirenbaum/neodim',
  event = 'LspAttach',
  config = 'vim.cmd("packadd neodim")',
})
