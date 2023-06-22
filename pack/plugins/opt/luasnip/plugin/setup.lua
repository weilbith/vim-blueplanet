local snippet_types = require('luasnip.util.types')

require('luasnip.config').setup({
  enable_autosnippets = true,
  updateevents = 'TextChanged,TextChangedI',
  delete_check_events = 'TextChanged,InsertEnter',
  ext_opts = {
    [snippet_types.insertNode] = {
      active = {
        virt_text = { { '', 'GreenBold' } },
      },
      passive = {
        -- hl_group = 'GreenUnderline',
        virt_text = { { '', 'GreenBold' } },
      },
      visited = {
        virt_text = { { '', 'GreyBold' } },
      },
    },
    [snippet_types.choiceNode] = {
      active = {
        virt_text = { { '', 'PurpleBold' } },
      },
      passive = {
        -- hl_group = 'PurpleUnderline',
        virt_text = { { '', 'PurpleBold' } },
      },
      visited = {
        virt_text = { { '', 'GreyBold' } },
      },
    },
  },
})

require('luasnip.loaders.from_lua').lazy_load()
require('luasnip').filetype_extend('typescript', { 'javascript' })
require('luasnip').filetype_extend('vue', { 'typescript', 'javascript' })
