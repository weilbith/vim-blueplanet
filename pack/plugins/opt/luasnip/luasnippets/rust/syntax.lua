local snippet = require('luasnip').snippet
local multi_snippet = require('luasnip').multi_snippet
local format = require('luasnip.extras.fmt').fmta
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local restore_node = require('luasnip').restore_node
local choice_node = require('luasnip').choice_node
local line_begin = require('luasnip.extras.conditions.expand').line_begin
local line_end = require('luasnip.extras.conditions.show').line_end

local trigger_name_node = require('snippets.nodes.general').trigger_name_node
local file_name_node = require('snippets.nodes.general').file_name_node

return nil,
  {
    snippet(
      {
        trig = 'fn',
        descr = 'function or method',
      },
      format(
        [[
          fn <name>(<arguments>)<return_type> {
            <body>
          }
        ]],
        {
          name = insert_node(1, 'name'),
          arguments = insert_node(2, ''),
          return_type = choice_node(3, {
            format(' ->> <>', { insert_node(1, 'Type') }, { dedent = false }),
            text_node(''),
          }),
          body = insert_node(4, '// TODO'),
        }
      ),
      {
        condition = line_begin * line_end,
      }
    ),

    multi_snippet(
      {
        common = { descr = 'template for "type" declarations' },
        'struct ',
        'enum ',
        'trait ',
      },
      format(
        [[
          <keyword><name> {
            <body>
          }
        ]],
        {
          keyword = trigger_name_node('struct', ' '),
          name = file_name_node(1, 'name', true),
          body = insert_node(2, '// TODO'),
        }
      ),
      {
        condition = line_begin * line_end,
      }
    ),

    snippet(
      {
        trig = 'impl ',
        descr = 'implement trait for struct or enum',
      },
      format(
        [[
          impl <statement> {
            <body>
          }
        ]],
        {
          statement = choice_node(1, {
            restore_node(nil, 'struct', insert_node(nil, 'struct')),
            format('<trait> for <struct>', {
              -- TODO: How to get all stubs automatically?
              struct = restore_node(1, 'struct', insert_node(nil, 'struct')),
              trait = insert_node(2, 'trait'),
            }),
          }, { restore_cursor = true }),
          body = insert_node(2, '// TODO'),
        }
      ),
      {
        condition = line_begin * line_end,
      }
    ),

    snippet(
      {
        trig = 'match ',
        descr = 'match expression',
      },
      format(
        [[
          match <structinee> {
            <body>
          }
        ]],
        {
          structinee = insert_node(1, 'structinee'),
          body = insert_node(2, '// TODO'),
        }
      ),
      {
        condition = line_end,
      }
    ),
  }
