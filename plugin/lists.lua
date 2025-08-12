vim.keymap.set(
  'n',
  '<leader>qq',
  '<cmd>copen<CR>',
  { desc = 'open quickfix window', unique = true }
)

vim.keymap.set('n', '<leader>qc', '<cmd>cclose<CR>', { desc = 'close quickfix window' })

vim.keymap.set(
  'n',
  '<leader>q<CR>',
  '<cmd>cc<CR>',
  { desc = 'jump to currently active entry of quickfix list' }
)

vim.keymap.set(
  'n',
  '<leader>ql',
  '<cmd>chistory<CR>',
  { desc = 'list history of quickfix lists', unique = true }
)

vim.keymap.set(
  'n',
  '<leader>ll',
  '<cmd>lopen<CR>',
  { desc = 'open location list for current window', unique = true }
)

vim.keymap.set(
  'n',
  '<leader>lc',
  '<cmd>lclose<CR>',
  { desc = 'close location list for current window' }
)

vim.keymap.set(
  'n',
  '<leader>l<CR>',
  '<cmd>ll<CR>',
  { desc = 'jump to currently active entry of location list for current window' }
)

vim.keymap.set(
  'n',
  '<leader>ll',
  '<cmd>lhistory<CR>',
  { desc = 'list history of location lists for current window' }
)
