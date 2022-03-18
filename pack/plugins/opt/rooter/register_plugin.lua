require('packer').use({
  'airblade/vim-rooter',
  setup = 'vim.cmd("packadd rooter")',
})
