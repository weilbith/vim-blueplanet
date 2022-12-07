require('packer').use({
  'DNLHC/glance.nvim',
  cmd = 'Glance',
  config = 'vim.cmd("packadd glance")',
})
