require('plugin_manager').lazy_load_plugin_on_command('glance.nvim', 'Glance')

vim.keymap.set(
  'n',
  'grr',
  '<cmd>Glance references<CR>',
  { desc = 'peek references of target under cursor' }
)

vim.keymap.set(
  'n',
  'gri',
  '<cmd>Glance implementations<CR>',
  { desc = 'peek implementations of target under cursor' }
)

vim.keymap.set(
  'n',
  'grt',
  '<cmd>Glance type_definitions<CR>',
  { desc = 'peek type definitions of target under cursor' }
)

vim.keymap.set(
  'n',
  'grd',
  '<cmd>Glance type_definitions<CR>',
  { desc = 'peek definitions of target under cursor' }
)
