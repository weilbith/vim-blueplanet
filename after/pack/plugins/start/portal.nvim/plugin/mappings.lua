require('plugin_manager').lazy_load_plugin_on_command('portal.nvim', 'Portal')

vim.keymap.set('n', '<C-o>', function()
  vim.cmd.Portal('jumplist backward')
end, { desc = 'navigate in the jump list backwards with previews of the locations' })

vim.keymap.set('n', '<C-i>', function()
  vim.cmd.Portal('jumplist forward')
end, { desc = 'navigate in the jump list backwards with previews of the locations' })
