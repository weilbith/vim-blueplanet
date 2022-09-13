require('satellite').setup({
  current_only = true,
  winblend = 0,
  zindex = 40,
  width = 4,
  handlers = {
    diagnostic = {
      enable = true,
    },
    search = {
      enable = false,
    },
    gitsigns = {
      enable = true,
    },
    marks = {
      enable = true,
    },
  },
  excluded_filetypes = {
    'code-action-menu',
    'code-action-menu-details',
    'code-action-menu-diff',
    'code-action-menu-menu',
    'code-action-menu-warning-message',
    'neo-tree',
    'DressingInput',
  },
})
