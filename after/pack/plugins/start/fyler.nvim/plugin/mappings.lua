require('plugin_manager').lazy_load_plugin_on_command('fyler.nvim', 'Fyler')

vim.keymap.set('n', '<F2>', vim.cmd.Fyler, { desc = 'toggle file tree viewer' })
