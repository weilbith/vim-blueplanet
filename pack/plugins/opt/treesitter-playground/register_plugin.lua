require('packer').use({
  'nvim-treesitter/playground',
  cmd = { 'TSPlaygroundToggle' },
  config = 'vim.cmd("packadd treesitter-playground")',
})
