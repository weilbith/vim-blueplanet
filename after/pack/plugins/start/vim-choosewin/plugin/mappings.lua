vim.keymap.set(
  'n',
  '<leader>ww',
  '<cmd>ChooseWin<CR>',
  { desc = 'show markers in all windows to pick from' }
)

vim.keymap.set(
  'n',
  '<leader>w<Tab>',
  '<cmd>ChooseWinSpawp<CR>',
  { desc = 'show markers in all windows to switch position with current window' }
)
