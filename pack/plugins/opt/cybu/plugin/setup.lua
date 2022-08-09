require('cybu').setup({
  position = {
    relative_to = 'editor',
    anchor = 'center',
  },
  style = {
    path = 'relative',
    border = 'single',
  },
  display_time = 1000,
  exclude = {
    'neo-tree',
    'NeogitStatus',
    'qf',
  },
})
