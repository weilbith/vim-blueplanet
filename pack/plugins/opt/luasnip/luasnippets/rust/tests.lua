local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta
local insert_node = require('luasnip').insert_node
local line_begin = require('luasnip.extras.conditions.expand').line_begin
local line_end = require('luasnip.extras.conditions.show').line_end

return nil,
  {
    snippet(
      {
        trig = 'mod test',
        descr = 'unit test suite',
      },
      format(
        [[
          #[cfg(test)]
          mod test {
            use super::*;
            
            <body>
          }
        ]],
        {
          body = insert_node(1),
        }
      ),
      {
        condition = line_begin * line_end,
      }
    ),

    snippet(
      {
        trig = '#test',
        descr = 'unit test case',
      },
      format(
        [[
          #[test]
          fn <name>() {
            <body>
          }
        ]],
        {
          name = insert_node(1, 'it_can_do'),
          body = insert_node(2, 'assert!(true)'),
        }
      ),
      {
        condition = line_begin * line_end,
      }
    ),
  }
