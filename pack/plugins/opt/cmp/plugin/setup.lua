local sources = require('cmp.config.sources')
local base_comparators = require('cmp.config.compare')
local under_comparators = require('cmp-under-comparator')

require('cmp').setup({
  sources = sources(
    {
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'treesitter' },
      { name = 'path' },
    },
    {
      { name = 'cmp_git' },
      { name = 'emoji', option = { insert = true } },
      { name = 'tmux', keyword_length = 5 },
    }
  ),
  snippet = {
    expand = function(arguments)
      local ok, luasnip = pcall(require, 'luasnip')

      if ok then
        luasnip.lsp_expand(arguments.body)
      end
    end,
  },
  experimental = {
    ghost_text = true,
  },
  formatting = {
    format = require('cmp_custom.formatting').format_entry,
  },
  sorting = {
    comparators = {
      base_comparators.offset,
      base_comparators.exact,
      base_comparators.score,
      under_comparators.under,
      base_comparators.kind,
      base_comparators.sort_text,
      base_comparators.length,
      base_comparators.order,
    }
  },
})
