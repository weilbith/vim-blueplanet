require('plugin_manager').load_package_on_command_s('namu.nvim', 'Namu')

vim.keymap.set(
  'n',
  'gO',
  '<cmd>Namu symbols<CR>',
  { desc = 'open filterable tree of symbols for navigation' }
)
