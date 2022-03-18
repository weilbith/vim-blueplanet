require('packer').use({
  'TimUntersberger/neogit',
  cmd = { 'Neogit' },
  config = 'vim.cmd("packadd neogit")',
})
