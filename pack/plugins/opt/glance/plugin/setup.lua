local glance = require('glance')

glance.setup({
  folds = {
    fold_closed = '',
    fold_open = '',
  },
  mappings = {
    list = {
      ['l'] = glance.actions.jump,
      ['h'] = glance.actions.close,
    },
  },
})
