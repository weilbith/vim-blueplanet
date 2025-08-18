require('plugin_manager').lazy_load_plugin_on_command('iswap.nvim', 'ISwapWith')

vim.keymap.set(
  'n',
  '<leader>cs',
  '<cmd>ISwapWith<CR>',
  { desc = 'swap target under cursor with sibling elements (e.g. entries of array)' }
)
