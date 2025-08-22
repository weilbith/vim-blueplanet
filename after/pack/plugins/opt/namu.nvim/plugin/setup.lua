local icons = require('icons')

local kindIcons = vim.tbl_map(function(symbol_kind)
  return symbol_kind.icon
end, icons.LSP.symbol_kind)

local kindsHighlights = vim.tbl_map(function(symbol_kind)
  return symbol_kind.highlight
end, icons.LSP.symbol_kind)

require('namu').setup({
  namu_symbols = {
    display = {
      format = 'tree_guides',
    },
    kindIcons = kindIcons,
    kinds = {
      prefix_kind_colors = true,
      enable_highlights = false,
      highlights = kindsHighlights,
    },
    current_highlight = {
      prefix_icon = icons.ChevronRight .. ' ',
    },
    multiselect = {
      selected_icon = icons.CheckboxChecked,
      unselected_icon = ' ',
    },
    window = {
      padding = 0,
      auto_size = false,
      width_ratio = 1,
      height_ratio = 0.5,
      min_height = 40,
      max_height = 60,
      title_prefix = icons.ChevronRight .. ' ',
      border = {
        '▔',
        '▔',
        '▔',
        ' ',
        '▁',
        '▁',
        '▁',
        ' ',
      },
    },
  },
})
