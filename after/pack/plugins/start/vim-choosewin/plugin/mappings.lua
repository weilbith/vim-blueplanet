require('plugin_manager').load_package_on_command_s(
  'vim-choosewin',
  { 'ChooseWin', 'ChooseWinSwap' }
)

vim.keymap.set(
  'n',
  '<leader>ww',
  '<cmd>ChooseWin<CR>',
  { desc = 'show markers in all windows to pick from' }
)

vim.keymap.set(
  'n',
  '<leader>w<Tab>',
  '<cmd>ChooseWinSwap<CR>',
  { desc = 'show markers in all windows to switch position with current window' }
)
