require('plugin_manager').lazy_load_plugin_on_command('vim-sayonara', 'Sayonara')

vim.keymap.set('n', '<leader>bd', function()
  vim.cmd.Sayonara({ bang = true })
end, { desc = 'delete current buffer, but keep window open' })
