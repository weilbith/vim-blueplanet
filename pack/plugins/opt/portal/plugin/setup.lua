require('portal').setup({
  query = { 'valid', 'valid', 'valid', 'different', 'different', 'modified' },
  labels = { 'o', 'j', 'f', 'k', 'd', 'l' },
  portal = {
    body = {
      options = {
        style = 'minimal',
        height = 5,
        border = 'none',
      },
    },
  },
})
