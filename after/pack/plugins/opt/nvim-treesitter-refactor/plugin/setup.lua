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
      keymaps = {
        goto_definition = false,
        list_definitions = false,
        list_definitions_toc = false,
        goto_next_usage = false,
        goto_previous_usage = false,
      },
    },
  },
})
