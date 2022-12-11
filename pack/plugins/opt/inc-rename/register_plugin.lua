require('packer').use({
  'smjonas/inc-rename.nvim',
  cmd = 'IncRename',
  config = 'vim.cmd("packadd inc-rename")',
})
