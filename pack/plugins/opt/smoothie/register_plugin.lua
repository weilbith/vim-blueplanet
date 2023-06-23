require('packer').use({
  'psliwka/vim-smoothie',
  fn = 'smoothie#*',
  setup = 'vim.cmd("packadd smoothie")',
})
