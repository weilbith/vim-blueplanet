local get_fill_character = require('custom.utils').get_fill_character

require('diffview').setup({
  enhanced_diff_hl = true,
  show_help_hints = false,
  signs = {
    fold_closed = get_fill_character('foldclose'),
    fold_open = get_fill_character('foldopen'),
  },
})
