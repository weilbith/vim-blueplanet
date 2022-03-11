local luasnip = require('luasnip')
local SnippetLibrary = require('snippets.SnippetLibrary')

require('luasnip.config').setup({
  enable_autosnippets = true,
  updateevents = 'TextChanged,TextChangedI',
  ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype,
})

luasnip.snippets = SnippetLibrary:new('snippets')
luasnip.autosnippets = SnippetLibrary:new('autosnippets')

luasnip.filetype_extend('typescript', { 'javascript' })
