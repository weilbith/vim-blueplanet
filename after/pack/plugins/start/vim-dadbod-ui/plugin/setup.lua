require('plugin_manager').load_package_on_command_s('vim-dadbod-ui', 'DBUIToggle')

vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_use_nerd_fonts = true
vim.g.db_ui_icons = {
  expanded = {
    db = '',
    buffers = '+',
    saved_queries = '+',
    schemas = '+',
    schema = '+',
    tables = '+',
    table = '+',
  },
  collapsed = {
    db = '',
    buffers = '-',
    saved_queries = '-',
    schemas = '-',
    schema = '-',
    tables = '-',
    table = '-',
  },
  saved_query = '*',
  new_query = '+',
  tables = '',
  buffers = '»',
  add_connection = '+',
  connection_ok = '',
  connection_error = '',
}
