local snippet_types = require('luasnip.util.types')

require('luasnip.config').setup({
  enable_autosnippets = true,
  updateevents = 'TextChanged,TextChangedI',
  delete_check_events = 'TextChanged,InsertEnter',
  ft_func = require('luasnip.extras.filetype_functions').from_pos_or_filetype,
  ext_opts = {
    [snippet_types.insertNode] = {
      active = {
        virt_text = { { '● insert', 'GreenBold' } },
      },
      passive = {
        virt_text = { { '● insert', 'BlueItalic' } },
      },
    },
    [snippet_types.choiceNode] = {
      active = {
        virt_text = { { '● choice', 'GreenBold' } },
      },
      passive = {
        virt_text = { { '● choice', 'PurpleItalic' } },
      },
    },
  },
})

require('luasnip.loaders.from_lua').lazy_load()
require('luasnip').filetype_extend('typescript', { 'javascript' })
