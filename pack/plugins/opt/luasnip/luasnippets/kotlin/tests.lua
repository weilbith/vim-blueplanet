local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta
local insert_node = require('luasnip').insert_node

local is_test_file = require('snippets.conditions').is_test_file

local test_node = format('@Test\nfun `<description>`() {\n  <body>\n}', {
  description = insert_node(1, 'it should...'),
  body = insert_node(2, '// TODO'),
})

return nil, { snippet('@Test', test_node, { condition = is_test_file }) }
