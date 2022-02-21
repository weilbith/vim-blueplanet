packer.use({
  'phaazon/hop.nvim',
  requires = { 'IndianBoy42/hop-extensions' },
  wants = { 'telescope.nvim', 'hop-extensions' },
  cmd = {
    'HopWordAC',
    'HopWordBC',
    'HopLineAC',
    'HopLineBC',
    'HopChar1AC',
    'HopChar1BC',
    'HopFunctions',
    'HopObjects',
    'HopDiagnostics',
    'HopParameters',
    'HopComments',
  },
  config = 'vim.cmd("packadd hop")',
})
