require('plugin_manager').lazy_load_plugin_on_lua_module('conform.nvim', 'conform')

vim.g.format_buffer_function = function(buffer)
  require('conform').format({ bufnr = buffer })
end
