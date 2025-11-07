vim.cmd.packadd('nvim-treesitter')

require('nvim-treesitter-textsubjects').configure({
  prev_selection = ',',
  keymaps = {
    ['.'] = 'textsubjects-smart',
    [';'] = 'textsubjects-container-inner',
  },
})

-- TODO:
-- Unfortunately the manual mappings doesn't work out for this plugin. I'm atm
-- too lazy to debug it...
