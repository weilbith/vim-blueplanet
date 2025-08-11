require('packer').use({
  'tpope/vim-dadbod',
  requires = { 'kristijanhusak/vim-dadbod-ui' },
  opt = true,
  setup = 'vim.cmd("packadd vim-dadbod")',
})

-- Packages for drivers: psql
