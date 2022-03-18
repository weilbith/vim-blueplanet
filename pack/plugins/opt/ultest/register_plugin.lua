require('packer').use({
  'rcarriga/vim-ultest',
  run = ':UpdateRemotePlugins',
  wants = { 'vim-test' },
  cmd = { 'Ultest', 'UltestNearest', 'UltestSummary' },
  config = 'vim.cmd("packadd ultest")',
})
