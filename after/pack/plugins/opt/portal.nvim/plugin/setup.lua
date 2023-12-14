require('portal').setup({
  query = { 'valid', 'valid', 'valid', 'different', 'different', 'modified' },
  labels = { 'o', 'j', 'f', 'k', 'd', 'l' },
  max_results = 4,
  window_options = {
    height = 6,
    style = 'minimal',
  },
})
