local glance = require('glance')

glance.register_method({
  name = 'vue_file_references',
  method = 'volar/client/findFileReference',
  label = 'Component Usages',
})

glance.setup({
  folds = {
    fold_closed = '',
    fold_open = '',
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
