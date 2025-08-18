require('plugin_manager').load_package_on_require_lua_module('nvim-dap', 'dap')

vim.keymap.set('n', '<leader>db', function()
  require('dap').toggle_breakpoint()
end, { desc = 'toggle debug breakpoint at cursor position' })

vim.keymap.set('n', '<leader>dr', function()
  require('dap').continue()
end, { desc = 'run new debugger session' })
