require('packer').use({
  'IndianBoy42/hop.nvim',
  cmd = {
    'HopWordAC',
    'HopWordBC',
    'HopLineAC',
    'HopLineBC',
    'HopChar1AC',
    'HopChar1BC',
    'HopFunctions'
  },
  config = 'vim.cmd("packadd hop")',
})
