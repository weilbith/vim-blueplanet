require('plugin_manages').lazy_load_plugin_on_event(
  'nvim-ts-autotag',
  { 'BufReadPre', 'BufNewFile' }
)
