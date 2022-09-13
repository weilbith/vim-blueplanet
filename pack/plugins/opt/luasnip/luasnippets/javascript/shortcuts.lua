local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta
local insert_node = require('luasnip').insert_node

local console_log_node = format('console.log(<>)', insert_node(1))

return {
  snippet({ trig = 'cl', name = 'console.log' }, console_log_node),
}, nil
