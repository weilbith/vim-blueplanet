vim.keymap.set(
  'n',
  '<leader>bd',
  '<cmd>bdelete<CR>',
  { desc = 'close current buffer with its window', unique = true }
)

vim.keymap.set(
  'n',
  '<leader>bn',
  '<cmd>bnext<CR>',
  { desc = 'open next listed buffer in current window' }
)

vim.keymap.set(
  'n',
  '<leader>bN',
  '<cmd>bprevious<CR>',
  { desc = 'open previous listed buffer in current window' }
)
