require('plugin_manager').lazy_load_plugin_on_event(
  'headlines.nvim',
  'FileType',
  { 'markdown', 'wimwiki', 'orgmode' }
)
