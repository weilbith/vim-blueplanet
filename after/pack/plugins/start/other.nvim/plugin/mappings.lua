require('plugin_manager').load_package_on_command_s('other.nvim', 'Other')

vim.keymap.set('n', '<leader>fo', '<cmd>Other<CR>', { desc = 'foo' })
