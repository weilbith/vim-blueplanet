require('plugin_manager').lazy_load_plugin_on_command(
  'vim-choosewin',
  { 'ChooseWin', 'ChooseWinSwap' }
)

vim.keymap.set(
  'n',
  '<leader>ww',
  vim.cmd.ChooseWin,
  { desc = 'show markers in all windows to pick from' }
)

vim.keymap.set(
  'n',
  '<leader>w<Tab>',
  vim.cmd.ChooseWinSwap,
  { desc = 'show markers in all windows to switch position with current window' }
)
