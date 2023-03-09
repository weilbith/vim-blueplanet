require('packer').use({
  'tpope/vim-dadbod',
  requires = { 'kristijanhusak/vim-dadbod-ui', cmd = 'DBUIToggle' },
  fn = 'db#*',
  setup = 'vim.cmd("packadd dadbod")',
})

-- Packages for drivers: psql
