require('plugin_manager').load_package_on_require_lua_module('conform.nvim', 'conform')

vim.g.format_buffer_function = function(buffer)
  require('conform').format({ bufnr = buffer })
end
