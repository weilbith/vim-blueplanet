vim.keymap.set(
  'n',
  'K',
  vim.lsp.buf.hover,
  { desc = 'show hover information for target under cursor' }
)
