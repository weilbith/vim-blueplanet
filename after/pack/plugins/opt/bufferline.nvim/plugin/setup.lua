local get_icon_by_severity_level = require('diagnostics.signs').get_icon_by_severity_level

require('bufferline').setup({
  options = {
    separator_style = 'slant',
    diagnostics = 'nvim_lsp',
    show_close_icon = false,
    show_buffer_close_icons = false,
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'Explorer',
        highlight = 'LightGrey',
        text_align = 'center',
      },
    },
    diagnostics_indicator = function(_, _, diagnostics)
      local all_indicators = ''

      for severity, count in pairs(diagnostics) do
        severity = severity == 'warning' and 'warn' or severity
        local indicator = ' ' .. count .. ' ' .. get_icon_by_severity_level(severity)
        all_indicators = all_indicators .. indicator
      end

      return all_indicators
    end,
    groups = {
      options = {
        toggle_hidden_on_enter = true,
      },
      items = {
        require('bufferline.groups').builtin.ungrouped,
        {
          name = 'Tests',
          icon = '',
          matcher = function(buffer)
            return buffer.name:match('%_spec') or buffer.path:match('^tests/')
          end,
        },
        {
          name = 'Docs',
          icon = '',
          matcher = function(buffer)
            return buffer.name:match('%.md')
              or buffer.name:match('%.rst')
              or buffer.path:match('docs?/')
          end,
        },
      },
    },
    custom_areas = {
      right = function()
        local all_buffer_numbers = vim.api.nvim_list_bufs()
        local number_of_loaded_buffers = 0

        for _, buffer_number in ipairs(all_buffer_numbers) do
          if vim.api.nvim_get_option_value('buflisted', { buf = buffer_number }) then
            number_of_loaded_buffers = number_of_loaded_buffers + 1
          end
        end

        local text = ' ' .. number_of_loaded_buffers
        return { { text = text, gui = 'bold' } }
      end,
    },
  },
})
