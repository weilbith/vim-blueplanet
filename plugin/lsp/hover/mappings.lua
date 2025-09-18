vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover({ border = 'single' })
end, { desc = 'show hover information for target under cursor' })
