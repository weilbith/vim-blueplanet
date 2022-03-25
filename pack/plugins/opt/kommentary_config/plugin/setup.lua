vim.g.kommentary_create_default_mappings = false

require('nvim-treesitter.configs').setup({
  context_commentstring = {
    enable = true,
  },
})

require('kommentary.config').configure_language('default', {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = false,
  hook_function = require('ts_context_commentstring.internal').update_commentstring(),
})
