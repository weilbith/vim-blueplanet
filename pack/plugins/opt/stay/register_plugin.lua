require('packer').use({
  'zhimsel/vim-stay',
  setup = 'vim.cmd("packadd stay")',
})
