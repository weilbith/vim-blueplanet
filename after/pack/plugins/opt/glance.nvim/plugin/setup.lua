local get_fill_character = require('custom.utils').get_fill_character
local glance = require('glance')

glance.register_method({
  name = 'vue_file_references',
  method = 'volar/client/findFileReference',
  label = 'Component Usages',
})

glance.setup({
  folds = {
    fold_closed = get_fill_character('foldclose'),
    fold_open = get_fill_character('foldopen'),
  },
  border = {
    enable = true,
    top_char = '▔',
    bottom_char = '▁',
  },
  list = {
    position = 'left',
  },
})
