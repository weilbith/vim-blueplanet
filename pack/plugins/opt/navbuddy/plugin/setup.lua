local function get_icons()
  local icons = {}

  for name, settings in pairs(require('lsp.symbols')) do
    if settings.is_symbol_kind then
      icons[name] = settings.icon .. ' '
    end
  end

  return icons
end

local minimum_width = 100

require('nvim-navbuddy').setup({
  icons = get_icons(),
  node_markers = {
    icons = {
      leaf = '   ',
      leaf_selected = '  ',
      branch = '  ',
    },
  },
  window = {
    sections = {
      left = {
        size = '33%',
        border = {
          style = { '', '▔', '', '', '', '▁', '', '' },
          padding = { left = 1, right = 1 },
        },
      },
      mid = {
        size = '33%',
        border = {
          style = { '', '▔', '', '', '', '▁', '', '' },
          padding = { left = 1, right = 1 },
        },
      },
      right = {
        border = {
          style = {
            top_left = '',
            top = '▔',
            top_right = '',
            right = '',
            bottom_right = '',
            bottom = '▁',
            bottom_left = '',
            left = '',
          },
          padding = { left = 1, right = 1 },
        },
      },
    },
    relative = 'win',
    size = function(window_number)
      local window_width = vim.api.nvim_win_get_width(window_number)
      local width = window_width > minimum_width and window_width or '100%'

      return {
        width = width,
        height = 18,
      }
    end,
    position = function(window_number)
      local window_width = vim.api.nvim_win_get_width(window_number)
      local window_column = vim.api.nvim_win_get_position(window_number)[2]
      local column = window_width > minimum_width and window_column or 0

      return {
        row = '50%',
        col = column,
      }
    end,
  },
  lsp = {
    auto_attach = true,
  },
  source_buffer = {
    follow_node = false,
    highlight = false,
  },
})
