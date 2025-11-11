require('plugin_manager').lazy_load_plugin_on_command('neo-tree.nvim', 'Neotree')

vim.keymap.set('n', '<F2>', function()
  vim.cmd.Neotree('toggle')
end, { desc = 'toggle file tree viewer' })

vim.keymap.set('n', '<leader>ft', function()
  vim.cmd.Neotree('reveal')
end, { desc = 'show current file in file tree viewer' })
