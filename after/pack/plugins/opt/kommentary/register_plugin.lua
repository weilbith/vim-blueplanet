require('packer').use({
  'b3nj5m1n/kommentary',
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    module = 'nvim-ts-context-commentstring',
  },
  keys = {
    '<Plug>kommentary_line_default',
    '<Plug>kommentary_visual_default',
  },
})
