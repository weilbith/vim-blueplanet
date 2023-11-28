vim.g.kommentary_create_default_mappings = false
vim.g.skip_ts_context_commentstring_module = true

require('ts_context_commentstring').setup({})

require('kommentary.config').configure_language('default', {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = false,
  hook_function = require('ts_context_commentstring.internal').update_commentstring(),
})
