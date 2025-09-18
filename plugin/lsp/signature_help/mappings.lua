vim.keymap.set({ 'n', 'i', 'o' }, '<C-k>', function()
  vim.lsp.buf.signature_help({ border = 'single' })
end, {})
