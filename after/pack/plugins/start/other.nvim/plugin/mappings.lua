require('plugin_manager').lazy_load_plugin_on_command('other.nvim', 'Other')

vim.keymap.set(
  'n',
  '<leader>fo',
  vim.cmd.Other,
  { desc = 'open selection of related files to current buffer' }
)
