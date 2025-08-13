require('plugin_manager').load_package_on_event_s(
  'headlines.nvim',
  'FileType',
  { 'markdown', 'wimwiki', 'orgmode' }
)
