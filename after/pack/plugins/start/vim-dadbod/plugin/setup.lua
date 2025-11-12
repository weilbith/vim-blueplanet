require('plugin_manager').lazy_load_plugin_on_command('vim-dadbod-ui', 'DBUIToggle')
local icons = require('icons')

vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_use_nerd_fonts = true
vim.g.db_ui_icons = {
  expanded = {
    db = '',
    buffers = icons.Add,
    saved_queries = icons.Add,
    schemas = icons.Add,
    schema = icons.Add,
    tables = icons.Add,
    table = icons.Add,
  },
  collapsed = {
    db = '',
    buffers = icons.remove,
    saved_queries = icons.remove,
    schemas = icons.remove,
    schema = icons.remove,
    tables = icons.remove,
    table = icons.remove,
  },
  saved_query = '*',
  new_query = icons.Add,
  tables = '',
  buffers = '»',
  add_connection = icons.Add,
  connection_ok = icons.CheckboxChecked,
  connection_error = icons.Error,
}
