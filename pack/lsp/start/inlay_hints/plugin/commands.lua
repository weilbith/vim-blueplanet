vim.api.nvim_create_user_command('ToggleInlayHints', function(arguments)
  local buffer_name = arguments.fargs[1]
  local buffer_number = buffer_name and vim.fn.buffer_number(buffer_name) or nil
  local new_is_enabled_state = require('inlay_hints').toggle(buffer_number)
  print('Inlay hints are ' .. (new_is_enabled_state and 'on' or 'off'))
end, {
  desc = 'Toggle the visibility of LSP inlay hints (globally if no buffer is specified).',
  complete = 'buffer',
  nargs = '?',
})
