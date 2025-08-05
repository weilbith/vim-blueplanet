require('packer').use({
  'phaazon/hop.nvim',
  requires = { 'IndianBoy42/hop-extensions', module = 'hop-extensions' },
  wants = { 'telescope.nvim' },
  module = { 'hop', 'hop-extensions' },
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
})
