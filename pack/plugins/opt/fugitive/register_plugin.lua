require('packer').use({
  'tpope/vim-fugitive',
  cmd = 'Git',
  config = 'vim.cmd("packadd fugitive")',
})
