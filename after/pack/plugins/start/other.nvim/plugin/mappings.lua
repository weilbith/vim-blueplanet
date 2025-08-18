require('plugin_manager').lazy_load_plugin_on_command('other.nvim', 'Other')

vim.keymap.set('n', '<leader>fo', '<cmd>Other<CR>', { desc = 'foo' })
