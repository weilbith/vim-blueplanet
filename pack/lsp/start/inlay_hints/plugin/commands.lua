vim.api.nvim_create_user_command('ToggleInlayHints', function()
  local buffer_number = 0
  local is_enabled = vim.lsp.inlay_hint.is_enabled(buffer_number)
  vim.lsp.inlay_hint.enable(0, not is_enabled)
end, {
  desc = 'Toggle the visibility of LSP inlay hints for the current buffer.',
})
