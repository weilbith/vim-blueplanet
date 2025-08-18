require('plugin_manager').lazy_load_plugin_on_lua_module('smart-tab.nvim', 'smart-tab')

vim.keymap.set({ 'i', 'v' }, '<C-l>', function()
  require('smart-tab').smart_tab()
end, {})
