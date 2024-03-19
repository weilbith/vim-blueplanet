local create_auto_commands = require('inlay_hints').create_auto_commands
local clear_auto_commands = require('inlay_hints').clear_auto_commands

vim.api.nvim_create_user_command('ToggleInlayHints', function()
  local buffer_number = 0
  local is_enabled = vim.lsp.inlay_hint.is_enabled(buffer_number)

  if is_enabled then
    clear_auto_commands()
    vim.lsp.inlay_hint.enable(0, false)
  else
    create_auto_commands()
    vim.lsp.inlay_hint.enable(0, true)
  end
end, {
  desc = 'Toggle the visibility of LSP inlay hints for the current buffer.',
})
