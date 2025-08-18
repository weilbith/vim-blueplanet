require("plugin_manager").load_package_on_require_lua_module("gitlinker.nvim", "gitlinker")

vim.keymap.set('n', '<leader>gy', function()
  require('gitlinker').get_buf_range_url('n')
end, { desc = 'yank URL to line of code at cursor on remote repository (e.g. on GitHub)' })
