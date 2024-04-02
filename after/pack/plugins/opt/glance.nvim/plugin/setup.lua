local get_fill_character = require('custom.utils').get_fill_character
local glance = require('glance')

glance.register_method({
  name = 'vue_file_references',
  method = 'volar/client/findFileReference',
  label = 'Component Usages',
})

glance.register_method({
  name = 'rust-analyzer_related-tests',
  method = 'rust-analyzer/relatedTests',
  label = 'Related Tests',
})

glance.setup({
  folds = {
    fold_closed = get_fill_character('foldclose'),
    fold_open = get_fill_character('foldopen'),
  },
  border = {
    enable = true,
    top_char = '▔',
    bottom_char = '▁',
  },
  list = {
    position = 'left',
  },
  hooks = {
    before_open = function(results, open, _, method)
      if method == 'rust-analyzer_related-tests' then
        results = vim.tbl_map(function(entry)
          return entry.runnable.location
        end, results)
      end

      open(results)
    end,
  },
})
