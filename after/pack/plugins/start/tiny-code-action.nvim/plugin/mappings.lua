require('plugin_manager').lazy_load_plugin_on_lua_module(
  'tiny-code-action.nvim',
  'tiny-code-action'
)

vim.keymap.set({ 'n', 'x' }, 'gra', function()
  require('tiny-code-action').code_action()
end, { desc = 'open menu with available code actions and their preview' })
