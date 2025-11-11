vim.keymap.set(
  'n',
  '<leader>bd',
  vim.cmd.bdelete,
  { desc = 'close current buffer with its window' }
)

vim.keymap.set(
  'n',
  '<leader>bn',
  vim.cmd.bnext,
  { desc = 'open next listed buffer in current window' }
)

vim.keymap.set(
  'n',
  '<leader>bN',
  vim.cmd.bprevious,
  { desc = 'open previous listed buffer in current window' }
)
