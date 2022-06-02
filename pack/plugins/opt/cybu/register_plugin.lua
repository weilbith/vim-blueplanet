require('packer').use({
  'ghillb/cybu.nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  keys = { '<Plug>(CybuNext)', '<Plug>(CybuPrev)' },
  config = 'vim.cmd("packadd cybu")',
})
