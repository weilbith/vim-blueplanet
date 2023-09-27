local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta
local insert_node = require('luasnip').insert_node
local line_begin = require('luasnip.extras.conditions.expand').line_begin
local line_end = require('luasnip.extras.conditions.show').line_end

return nil,
  {
    snippet(
      {
        trig = 'csl',
        descr = 'console.log statement',
      },
      format('console.log(<>)', { insert_node(1) }),
      {
        condition = line_begin * line_end,
      }
    ),
  }
