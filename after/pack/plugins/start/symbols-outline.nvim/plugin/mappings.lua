require('plugin_manager').lazy_load_plugin_on_command('symbols-outline.nvim', 'SymbolsOutline')

vim.keymap.set('n', '<F3>', vim.cmd.SymbolsOutline, { desc = 'toggle outline of symbols' })
