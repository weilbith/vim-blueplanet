require('packer').use({
  'vim-scripts/vim-asterisk',
  keys = {
    '<Plug>(asterisk-*)',
    '<Plug>(asterisk-#)',
    '<Plug>(asterisk-g*)',
    '<Plug>(asterisk-g#)',
    '<Plug>(asterisk-z*)',
    '<Plug>(asterisk-gz*)',
    '<Plug>(asterisk-z#)',
    '<Plug>(asterisk-gz#)',
  },
})
