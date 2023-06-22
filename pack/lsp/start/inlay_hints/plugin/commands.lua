vim.api.nvim_create_user_command('ToggleInlayHints', function()
  vim.lsp.buf.inlay_hint(0, nil)
end, {
  desc = 'Toggle the visibility of LSP inlay hints for the current buffer.',
})
