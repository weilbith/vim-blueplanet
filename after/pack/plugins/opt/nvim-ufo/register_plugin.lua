require('packer').use({
  'kevinhwang91/nvim-ufo',
  requires = { 'kevinhwang91/promise-async', module = { 'promise', 'async' } },
  opt = true,
})
