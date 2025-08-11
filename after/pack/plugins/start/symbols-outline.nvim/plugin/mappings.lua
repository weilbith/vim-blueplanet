require('plugin_manager').load_package_on_command_s('symbols-outline.nvim', 'SymbolsOutline')

vim.keymap.set('n', '<F3>', '<cmd>SymbolsOutline<CR>', { desc = 'toggle outline of symbols' })
