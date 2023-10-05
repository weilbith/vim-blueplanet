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
    format = require('custom.cmp.formatting').format_entry,
  },
  mapping = mappings.preset.insert(),
  window = {
    documentation = {
      winhighlight = 'Normal:DarkGreyBackgroundContrast',
    },
  },
})

require('cmp').setup.cmdline('/', {
  sources = sources({
    { name = 'buffer' },
  }),
  mapping = mappings.preset.cmdline(),
})

require('cmp').setup.cmdline(':', {
  sources = sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
  mapping = mappings.preset.cmdline(),
})

require('cmp_git').setup()

require('plugin_configuration').reload_filetype_plugins_for_loaded_buffers()
