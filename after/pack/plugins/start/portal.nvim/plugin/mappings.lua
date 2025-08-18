require('plugin_manager').lazy_load_plugin_on_command('portal.nvim', 'Portal')

vim.keymap.set(
  'n',
  '<C-o>',
  '<cmd>Portal jumplist backward<CR>',
  { desc = 'navigate in the jump list backwards with previews of the locations' }
)

vim.keymap.set(
  'n',
  '<C-i>',
  '<cmd>Portal jumplist forward<CR>',
  { desc = 'navigate in the jump list backwards with previews of the locations' }
)
