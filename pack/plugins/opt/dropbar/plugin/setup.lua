local constants = require('dropbar_custom.constants')

require('dropbar').setup({
  general = {
    -- Rather embed this manually into separated winbar plugin.
    enable = false,
  },
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
    padding = {
      left = 0,
      right = 0,
    },
  },
})
