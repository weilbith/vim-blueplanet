require('plugin_manager').lazy_load_plugin_on_command('glance.nvim', 'Glance')

vim.keymap.set('n', 'grr', function()
  vim.cmd.Glance('references')
end, { desc = 'peek references of target under cursor' })

vim.keymap.set('n', 'gri', function()
  vim.cmd.Glance('implementations')
end, { desc = 'peek implementations of target under cursor' })

vim.keymap.set('n', 'grt', function()
  vim.cmd.Glance('type_definitions')
end, { desc = 'peek type definitions of target under cursor' })

vim.keymap.set('n', 'grd', function()
  vim.cmd.Glance('definitions')
end, { desc = 'peek definitions of target under cursor' })
