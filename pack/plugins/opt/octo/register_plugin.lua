require('packer').use({
  'pwntester/octo.nvim',
  requires = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  cmd = 'Octo',
  config = 'vim.cmd("packadd octo")',
})
