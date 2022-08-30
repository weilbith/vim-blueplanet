vim.api.nvim_create_user_command('UpdatePlugins', function()
  vim.api.nvim_command('packadd plugin_manager')
  require('plugin_manager').update()
end, { desc = 'Upate all plugins and install missing ones' })
