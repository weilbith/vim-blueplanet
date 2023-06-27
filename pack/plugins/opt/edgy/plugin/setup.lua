require('edgy').setup({
  icons = {
    closed = ' ▷',
    open = ' ◢ ',
  },
  left = {
    {
      title = 'EXPLORER',
      ft = 'neo-tree',
      filter = function(buffer_number)
        return vim.b[buffer_number].neo_tree_source == 'filesystem'
      end,
      pinned = true,
      open = 'Neotree position=right filesystem',
      size = { height = 0.5 },
    },
    {
      title = 'GIT STATUS',
      ft = 'neo-tree',
      filter = function(buffer_number)
        return vim.b[buffer_number].neo_tree_source == 'git_status'
      end,
      pinned = true,
      open = 'Neotree position=right git_status',
    },
    {
      title = 'OPEN BUFFERS',
      ft = 'neo-tree',
      filter = function(buffer_number)
        return vim.b[buffer_number].neo_tree_source == 'buffers'
      end,
      pinned = true,
      open = 'Neotree position=top buffers',
    },
  },
  bottom = {
    {
      title = 'QUICK FIX LIST',
      ft = 'qf',
    },
  },
  right = {
    {
      title = 'OUTLINE',
      ft = 'Outline',
      pinned = true,
      open = 'SymbolsOutline',
      size = { height = 0.5 },
    },
    {
      title = 'TESTS',
      ft = 'neotest-summary',
      pinned = true,
      open = 'Neotest summary open',
    },
  },
})
