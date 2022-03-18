local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta
local insert_node = require('luasnip').insert_node

local trigger_name_node = require('snippets.utilitiy_nodes').trigger_name_node
local selected_text_node = require('snippets.utilitiy_nodes').selected_text_node

local augroup_node = format('<keyword><name>\n  autocmd!\n  autocmd <body>\naugroup END', {
  keyword = trigger_name_node('augroup ', ' '),
  name = insert_node(1, 'GroupName'),
  body = selected_text_node(2, 'BufEnter * echo "TODO"'),
})

return {
  autosnippets = {
    snippet({ trig = '^augroup ', regTrig = true }, augroup_node),
  },
}
