require('plugin_manager').lazy_load_plugin_on_command('neo-tree.nvim', 'Neotree')

vim.keymap.set('n', '<F2>', '<cmd>Neotree toggle<CR>', { desc = 'toggle file tree viewer' })

vim.keymap.set(
  'n',
  '<leader>ft',
  '<cmd>Neotree reveal<CR>',
  { desc = 'show current file in file tree viewer' }
)
