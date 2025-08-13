local lsp_symbols = require('lsp.symbols')

local kindIcons = vim.tbl_map(function(symbol)
  return symbol.icon
end, lsp_symbols)

local kindsHighlights = vim.tbl_map(function(symbol)
  return symbol.highlight
end, lsp_symbols)

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
      prefix_icon = ' ',
    },
    multiselect = {
      selected_icon = '',
      unselected_icon = ' ',
    },
    window = {
      padding = 0,
      auto_size = false,
      width_ratio = 1,
      height_ratio = 0.5,
      min_height = 40,
      max_height = 60,
      title_prefix = ' ',
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
