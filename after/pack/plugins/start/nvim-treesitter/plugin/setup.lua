require('nvim-treesitter.configs').setup({
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = '<space>.',
      node_decremental = '<space>;',
    },
  },
})
