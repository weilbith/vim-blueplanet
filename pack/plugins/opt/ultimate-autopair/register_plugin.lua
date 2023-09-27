require('packer').use({
  'altermo/ultimate-autopair.nvim',
  event = 'InsertEnter',
  config = 'vim.cmd("packadd ultimate-autopair")',
})
