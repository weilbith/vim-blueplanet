vim.api.nvim_create_user_command('ToggleInlayHints', function(options)
  local buffer = tonumber(options.fargs[1])
  local is_enabled_now = require('inlay_hints').toggle(buffer)
  print('Inlay hints are ' .. (is_enabled_now and 'on' or 'off'))
end, {
  desc = 'Toggle the visibility of LSP inlay hints (globally if no buffer is specified).',
  complete = require('custom.utils').get_buffers_as_completion_options,
  nargs = '?',
})
