require('tiny-code-action').setup({
  backend = 'delta',
  backend_opts = {
    delta = {
      args = {
        '--line-numbers',
      },
    },
  },
  telescope_opts = {
    layout_strategy = 'cursor',
    layout_config = {
      preview_height = nil, -- fix error on horizontal strategy
    },
  },
})
