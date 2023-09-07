require('packer').use({
  'lukas-reineke/indent-blankline.nvim',
  branch = 'v3',
  config = 'vim.cmd("packadd indent-blankline")',
})
