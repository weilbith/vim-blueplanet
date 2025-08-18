require("plugin_manager").load_package_on_require_lua_module("smart-tab.nvim", "smart-tab")

vim.keymap.set({ 'i', 'v' }, '<C-l>', function()
  require('smart-tab').smart_tab()
end, {})
