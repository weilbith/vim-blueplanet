local sources = require('cmp.config.sources')
local mappings = require('cmp').mapping

require('cmp').setup({
  sources = sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lua' },
    { name = 'treesitter' },
    { name = 'path' },
  }, {
    { name = 'git' },
    { name = 'emoji', option = { insert = true } },
    { name = 'tmux', keyword_length = 5 },
  }),
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
  mapping = mappings.preset.insert(),
  window = {
    documentation = {
      winhighlight = 'Normal:DarkGreyBackgroundContrast',
    },
  },
})
