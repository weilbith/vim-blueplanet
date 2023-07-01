local glance = require('glance')

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
