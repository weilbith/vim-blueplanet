vim.keymap.set('n', '<leader>qq', vim.cmd.copen, { desc = 'open quickfix window', unique = true })

vim.keymap.set('n', '<leader>qc', vim.cmd.cclose, { desc = 'close quickfix window' })

vim.keymap.set(
  'n',
  '<leader>q<CR>',
  vim.cmd.cc,
  { desc = 'jump to currently active entry of quickfix list' }
)

vim.keymap.set(
  'n',
  '<leader>ql',
  vim.cmd.chistory,
  { desc = 'list history of quickfix lists', unique = true }
)

vim.keymap.set(
  'n',
  '<leader>ll',
  vim.cmd.lopen,
  { desc = 'open location list for current window', unique = true }
)

vim.keymap.set(
  'n',
  '<leader>lc',
  vim.cmd.lclose,
  { desc = 'close location list for current window' }
)

vim.keymap.set(
  'n',
  '<leader>l<CR>',
  vim.cmd.ll,
  { desc = 'jump to currently active entry of location list for current window' }
)

vim.keymap.set(
  'n',
  '<leader>ll',
  vim.cmd.lhistory,
  { desc = 'list history of location lists for current window' }
)
