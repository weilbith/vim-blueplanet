require('nvim-treesitter.configs').setup({
  refactor = {
    highlight_definitions = {
      enable = false,
    },
    highlight_current_scope = {
      enable = false,
    },
    navigation = {
      enable = true,
      keymaps = {},
    },
  },
})
