packer.use({
  'voldikss/vim-floaterm',
  cmd = { 'FloatermNew', 'FloatermToggle' },
  config = 'vim.cmd("packadd floaterm")',
})
