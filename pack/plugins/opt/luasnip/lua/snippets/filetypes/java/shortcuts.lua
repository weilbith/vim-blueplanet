local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta
local insert_node = require('luasnip').insert_node

local println_node = format('System.out.println(<message>);', {
  message = insert_node(1, '"TODO"'),
})

return {
  autosnippets = {
    snippet('syso', println_node),
  },
}
