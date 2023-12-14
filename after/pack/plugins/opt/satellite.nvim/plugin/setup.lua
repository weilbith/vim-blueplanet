require('satellite').setup({
  current_only = true,
  winblend = 0,
  handlers = {
    cursor = {
      enable = false,
    },
    diagnostic = {
      signs = { '▂' },
    },
    gitsigns = {
      signs = {
        add = '┃',
        change = '┃',
        delete = '┃',
      },
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
