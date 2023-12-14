local snippet_types = require('luasnip.util.types')
local extend_load_ft = require('luasnip.extras.filetype_functions').extend_load_ft

require('luasnip').setup({
  history = true,
  enable_autosnippets = true,
  delete_check_events = 'TextChanged,InsertEnter',
  -- Does not work?
  load_ft_func = extend_load_ft({
    typescript = { 'javascript' },
    vue = { 'typescript', 'javascript' },
  }),
  ext_opts = {
    [snippet_types.choiceNode] = {
      active = {
        virt_text = { { '', 'PurpleBold' } },
      },
    },
  },
})

require('luasnip.loaders.from_lua').lazy_load()
require('luasnip').filetype_extend('typescript', { 'javascript' })
require('luasnip').filetype_extend('vue', { 'typescript', 'javascript' })
require('luasnip').filetype_extend('typescriptreact', { 'typescript', 'javascript' })
