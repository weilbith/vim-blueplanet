vim.api.nvim_create_user_command('UpdatePlugins', function()
  vim.api.nvim_command('packadd plugin-manager')
  require('plugin_manager').update()
end, { desc = 'Update all plugins and install missing ones' })

vim.api.nvim_create_user_command('InstallNewPlugins', function()
  vim.api.nvim_command('packadd plugin-manager')
  require('plugin_manager').install_new()
end, { desc = 'Install only all missing/new plugins' })
