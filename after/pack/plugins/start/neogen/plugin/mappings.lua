require('plugin_manager').lazy_load_plugin_on_command('neogen', 'Neogen')

vim.keymap.set(
  'n',
  '<leader>rg',
  '<cmd>Neogen<CR>',
  { desc = 'generate code documentation with snippets for target under cursor' }
)
