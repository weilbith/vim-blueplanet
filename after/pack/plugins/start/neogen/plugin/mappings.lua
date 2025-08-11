require('plugin_manager').load_package_on_command_s('neogen', 'Neogen')

vim.keymap.set(
  'n',
  '<leader>rg',
  '<cmd>Neogen<CR>',
  { desc = 'generate code documentation with snippets for target under cursor' }
)
