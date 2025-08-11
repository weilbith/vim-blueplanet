require('plugin_manager').load_package_on_command_s('neo-tree.nvim', 'Neotree')

vim.keymap.set('n', '<F2>', '<cmd>Neotree toggle<CR>', { desc = 'toggle file tree viewer' })

vim.keymap.set(
  'n',
  '<leader>ft',
  '<cmd>Neotree reveal<CR>',
  { desc = 'show current file in file tree viewer' }
)
