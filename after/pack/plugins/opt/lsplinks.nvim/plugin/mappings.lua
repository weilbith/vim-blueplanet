vim.keymap.set(
  'n',
  'gx',
  require('lsplinks').gx,
  { desc = "open link at cursor - native 'gx' enhanced with LSP document links" }
)
