vim.api.nvim_create_user_command('ToggleAutomaticFormatting', function(options)
  local buffer = tonumber(options.fargs[1])
  local is_enabled_now = require('formatting.configuration').toggle_automatic_formatting(buffer)
  print('Formatting is now ' .. (is_enabled_now and 'on' or 'off'))
end, {
  desc = 'Toggles formatting on or off (globally if no buffer is specified)',
  complete = require('custom.utils').get_buffers_as_completion_options,
  nargs = '?',
})

vim.api.nvim_create_user_command('FormatBuffer', function(options)
  local buffer = tonumber(options.fargs[1])
  require('formatting').format_buffer(buffer)
end, {
  desc = 'Format buffer (current buffer if none is specified)',
  complete = require('custom.utils').get_buffers_as_completion_options,
  nargs = '?',
})
