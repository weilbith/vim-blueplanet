packer.use({
  'pwntester/octo.nvim',
  requires = {'nvim-lua/plenary.nvim'},
  wants = 'telescope.nvim',
  cmd = 'Octo',
  config = 'vim.cmd("packadd octo")',
})
