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
          fn <name>(<arguments>)<return_type><body>
        ]],
        {
          name = insert_node(1, 'name'),
          arguments = insert_node(2, ''),
          return_type = choice_node(3, {
            format(' ->> <>', { insert_node(1, 'Type') }, { dedent = false }),
            text_node(''),
          }),
          body = choice_node(4, {
            -- TODO: Do this automatically in a trait definition.
            text_node(';'),
            format('{\n  <>\n}', { insert_node(1, 'todo();') }),
          }),
        }
      ),
      {
        condition = line_begin * line_end,
      }
    ),

    multi_snippet(
      {
        common = {
          descr = 'define a struct type',
          condition = line_begin * line_end,
        },
        'struct',
        'pub struct',
      },
      format('<keyword> <name><body>', {
        keyword = trigger_name_node('struct'),
        name = file_name_node(1, 'Name', true),
        body = choice_node(2, {
          text_node(';'),
          format('(<>);', { insert_node(1, '') }),
          format(' {\n  <>\n}', { insert_node(1, '') }, { dedent = false }),
        }),
      })
    ),

    multi_snippet(
      {
        common = {
          descr = 'template for "type" declarations',
          condition = line_begin * line_end,
        },
        'enum ',
        'trait ',
      },
      format('<keyword><name> {<body>}', {
        keyword = trigger_name_node('enum', ' '),
        name = file_name_node(1, 'name', true),
        body = insert_node(2, ''),
      })
    ),

    snippet(
      {
        trig = 'impl ',
        descr = 'implement trait for a type',
      },
      format(
        [[
          impl <type> {<body>}
        ]],
        {
          type = choice_node(1, {
            restore_node(nil, 'type', insert_node(nil, 'Type')),
            format('<trait> for <type>', {
              -- TODO: How to get all stubs automatically?
              type = restore_node(1, 'type', insert_node(nil, 'Type')),
              trait = insert_node(2, 'trait'),
            }),
          }, { restore_cursor = true }),
          body = insert_node(2, ''),
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
          body = insert_node(2, ''),
        }
      ),
      {
        condition = line_end,
      }
    ),

    snippet(
      {
        trig = 'type ',
        descr = 'define a type alias',
      },
      format('type <identifier> = <type><where_clause>;', {
        identifier = insert_node(1, 'Identifier'),
        type = insert_node(2, 'Type'),
        where_clause = choice_node(3, {
          -- TODO: Do automatically if there is a generic type without
          -- definition.
          text_node(''),
          format(' where <>', { insert_node(1, '') }, { dedent = false }),
        }),
      }),
      {
        condition = line_begin * line_end,
      }
    ),
  }
