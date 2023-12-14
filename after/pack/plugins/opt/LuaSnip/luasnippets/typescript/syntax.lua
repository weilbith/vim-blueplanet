local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node

local trigger_name_node = require('snippets.nodes.general').trigger_name_node
local selected_text_node = require('snippets.nodes.general').selected_text_node

local extends_node = format('<keyword><name> ', {
  keyword = trigger_name_node('extends', ' '),
  name = insert_node(1, 'name'),
})

local interface_node = format('<keyword><name> <extends>{\n  <body>\n}', {
  keyword = trigger_name_node('interface', ' '),
  name = insert_node(1, 'name'),
  extends = choice_node(2, {
    text_node(''),
    extends_node,
  }),
  body = selected_text_node(3, '// TODO'),
})

local enum_node = format('<keyword><name> {\n  <body>\n}', {
  keyword = trigger_name_node('enum', ' '),
  name = insert_node(1, 'name'),
  body = selected_text_node(2, '// TODO'),
})

return nil,
  {
    snippet({ trig = '^interface ', regTrig = true }, interface_node),
    snippet({ trig = '^enum ', regTrig = true }, enum_node),
  }
