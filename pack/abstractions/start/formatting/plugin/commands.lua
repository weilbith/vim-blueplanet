vim.api.nvim_create_user_command('ToggleAutomaticFormatting', function(arguments)
  local buffer_name = arguments.fargs[1]
  local buffer_number = buffer_name and vim.fn.buffer_number(buffer_name) or nil
  local new_is_enabled_state =
    require('formatting.configuration').toggle_automatic_formatting(buffer_number)
  print('Formatting is now ' .. (new_is_enabled_state and 'on' or 'off'))
end, {
  desc = 'Toggles formatting on or off (globally if no buffer is specified)',
  complete = 'buffer',
  nargs = '?',
})

vim.api.nvim_create_user_command('FormatBuffer', function(arguments)
  local buffer_name = arguments.fargs[1]
  local buffer_number = buffer_name and vim.fn.buffer_number(buffer_name) or nil
  require('formatting').format_buffer(buffer_number)
end, {
  desc = 'Format buffer (current buffer if none is specified)',
  complete = 'buffer',
  nargs = '?',
})
