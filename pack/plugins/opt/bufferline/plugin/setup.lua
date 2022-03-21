local get_icon_by_severity_level = require('diagnostics.signs').get_icon_by_severity_level

require('bufferline').setup({
  options = {
    indicator_icon = '▌ ',
    separator_style = 'slant',
    diagnostics = 'nvim_lsp',
    show_close_icon = false,
    show_buffer_close_icons = false,
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Grey',
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
  },
})