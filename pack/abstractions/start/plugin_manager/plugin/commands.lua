vim.api.nvim_create_user_command('UpdatePlugins', function()
  vim.cmd.packadd('plugin_manager')
  require('plugin_manager').update()
end, { desc = 'Update all plugins and install missing ones' })

vim.api.nvim_create_user_command('InstallNewPlugins', function()
  vim.cmd.packadd('plugin_manager')
  require('plugin_manager').install_new()
end, { desc = 'Install only all missing/new plugins' })
