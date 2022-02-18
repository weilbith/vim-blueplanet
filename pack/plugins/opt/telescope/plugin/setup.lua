require('telescope').setup({
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "   ",
    winblend = 10,
    file_ignore_patterns = { "%.fls", "%.fdb_latexmk" },
    borderchars = { ' ' },
    sorting_strategy = "ascending",
    dynamic_preview_title = true,
    path_display = {
      truncate = true
    },
    cache_picker = {
      num_pickers = -1,
    },
    layout_config = {
      horizontal = {
        prompt_position = "top"
      },
    },
  },
})
