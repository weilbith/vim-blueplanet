vim.keymap.set(
  'n',
  'gD',
  vim.lsp.buf.definition,
  { desc = 'jump to definition of target under cursor (LSP)' }
)
