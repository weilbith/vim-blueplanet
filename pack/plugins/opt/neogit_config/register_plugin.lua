require('packer').use({
  'TimUntersberger/neogit',
  requires = { 'nvim-lua/plenary.nvim' },
  cmd = { 'Neogit' },
  config = 'vim.cmd("packadd neogit_config")',
})
