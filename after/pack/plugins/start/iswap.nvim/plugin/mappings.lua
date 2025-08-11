require('plugin_manager').load_package_on_command_s('iswap.nvim', 'ISwapWith')

vim.keymap.set(
  'n',
  '<leader>cs',
  '<cmd>ISwapWith<CR>',
  { desc = 'swap target under cursor with sibling elements (e.g. entries of array)' }
)
