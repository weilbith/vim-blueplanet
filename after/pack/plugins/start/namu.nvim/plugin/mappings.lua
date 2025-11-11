require('plugin_manager').lazy_load_plugin_on_command('namu.nvim', 'Namu')

vim.keymap.set('n', 'gO', function()
  vim.cmd.Namu('symbols')
end, { desc = 'open filterable tree of symbols for navigation' })
