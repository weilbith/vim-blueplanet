require('packer').use({
  'phaazon/hop.nvim',
  requires = { 'IndianBoy42/hop-extensions', module = 'hop-extensions' },
  wants = { 'telescope.nvim' },
  module = { 'hop', 'hop-extensions' },
  opt = true,
})
