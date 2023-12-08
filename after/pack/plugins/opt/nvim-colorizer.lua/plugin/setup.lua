require('colorizer').setup({
  filetypes = { '*' },
  user_default_options = {
    mode = 'inline',
    virtualtext = '  ',
    css = true,
    css_fn = true,
    tailwind = true,
    sass = {
      enable = true,
    },
  },
})
