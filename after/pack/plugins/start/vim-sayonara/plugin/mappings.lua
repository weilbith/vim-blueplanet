require('plugin_manager').load_package_on_command_s('vim-sayonara', 'Sayonara')

vim.keymap.set(
  'n',
  '<leader>bd',
  '<cmd>Sayonara!<CR>',
  { desc = 'delete current buffer, but keep window open' }
)
