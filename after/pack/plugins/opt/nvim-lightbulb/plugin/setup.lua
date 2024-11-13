require('nvim-lightbulb').setup({
  code_lenses = true,
  action_kinds = { "quickfix" },
  sign = {
    enabled = false,
  },
  float = {
    enabled = true,
    text = '',
    lens_text = '󱡴',
    win_opts = {
      winblend = 60,
    },
  },
})
