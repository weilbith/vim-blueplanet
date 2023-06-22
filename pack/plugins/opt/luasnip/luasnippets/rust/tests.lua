local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta
local insert_node = require('luasnip').insert_node

local test_case_node = format('#[test]\nfn <name>() {\n  <body>\n}', {
  name = insert_node(1, 'it_can_do'),
  body = insert_node(2, 'assert!(true)'),
})

local test_module_node = format('#[cfg(test)]\nmod test {\n  use super::*;\n\n  <body>\n}', {
  body = insert_node(1),
})

return nil,
  {
    snippet({ trig = '^mod test', regTrig = true }, test_module_node),
    snippet({ trig = '^.*#test', regTrig = true }, test_case_node),
  }
