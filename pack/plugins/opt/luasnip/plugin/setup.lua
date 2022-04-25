local luasnip = require('luasnip')
local snippet_types = require('luasnip.util.types')
local SnippetLibrary = require('snippets.SnippetLibrary')

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

luasnip.snippets = SnippetLibrary:new('snippets')
luasnip.autosnippets = SnippetLibrary:new('autosnippets')

luasnip.filetype_extend('typescript', { 'javascript' })
