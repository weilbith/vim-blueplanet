-- TODO: causes errors
require('plugin_manager').load_package_on_require_lua_module(
  'tiny-code-action.nvim',
  'tiny-code-action'
)

vim.keymap.set({ 'n', 'x' }, 'gra', function()
  require('tiny-code-action').code_action()
end, { desc = 'open menu with available code actions and their preview' })
