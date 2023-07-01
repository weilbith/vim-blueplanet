require('packer').use({
  'SmiteshP/nvim-navbuddy',
  requires = {
    { 'SmiteshP/nvim-navic', module = 'nvim-navic' },
    { 'MunifTanjim/nui.nvim', module = 'nui' },
  },
  cmd = 'Navbuddy',
  config = 'vim.cmd.packadd("navbuddy")',
})
