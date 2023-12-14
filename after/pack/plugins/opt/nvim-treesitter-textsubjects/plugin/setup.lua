require('nvim-treesitter.configs').setup({
  textsubjects = {
    enable = true,
    prev_selection = ',',
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
    },
  },
})

-- TODO:
-- Unfortunately the manual mappings doesn't work out for this plugin. I'm atm
-- too lazy to debug it...
