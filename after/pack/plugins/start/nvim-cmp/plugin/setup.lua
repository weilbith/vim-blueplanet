local sources = require('cmp.config.sources')

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
      vim.snippet.expand(arguments.body)
    end,
  },
  experimental = {
    ghost_text = true,
  },
  formatting = {
    format = require('custom.cmp.formatting').format_entry,
  },
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
})

require('cmp').setup.cmdline(':', {
  sources = sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
})

require('cmp_git').setup()

-- require('plugin_configuration').reload_filetype_plugins_for_loaded_buffers()

-- require('cmp').event:on('menu_closed', function()
--   require('custom.cmp.automatic_confirmation').maybe_confirm_last_selected_completion_entry()
-- end)
