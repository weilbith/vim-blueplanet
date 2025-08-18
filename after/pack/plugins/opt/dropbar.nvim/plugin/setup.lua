vim.cmd.packadd('nvim-web-devicons')

local constants = require('dropbar_custom.constants')

require('dropbar').setup({
  icons = {
    symbols = constants.symbols,
    ui = {
      bar = {
        separator = ' ' .. constants.separator .. ' ',
      },
      menu = {
        indicator = constants.separator,
      },
    },
  },
  bar = {
    enable = false, -- Rather embed this manually into separated winbar plugin.
    padding = {
      left = 0,
      right = 0,
    },
  },
})
