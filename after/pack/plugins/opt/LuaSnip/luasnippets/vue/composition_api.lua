local snippet = require('luasnip').snippet
local snippet_node = require('luasnip').snippet_node
local multi_snippet = require('luasnip').multi_snippet
local format = require('luasnip.extras.fmt').fmta
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node
local restore_node = require('luasnip').restore_node
local line_end = require('luasnip.extras.conditions.show').line_end

local trigger_name_node = require('snippets.nodes.general').trigger_name_node
local get_node_options_with_lsp_code_action_callback = require(
  'snippets.callbacks.lsp_code_actions'
).get_node_options_with_lsp_code_action_callback

local function block_or_statement_node(jump_index, restore_key)
  restore_key = restore_key or 'block_or_statement'

  return choice_node(jump_index, {
    format('{<>}', { restore_node(1, restore_key) }),
    restore_node(nil, restore_key),
  }, { restore_cursor = true })
end

local define_props_node = format('defineProps<<<type>>>()', {
  type = insert_node(1, 'Props'),
})

return nil,
  {
    snippet(
      {
        trig = '= computed',
        descr = 'computed property',
      },
      format('<keyword>(<body>)', {
        keyword = trigger_name_node(),
        body = choice_node(1, {
          format('() =>> {<>}', { restore_node(1, 'getter_body') }),
          format('() =>> <>', { restore_node(1, 'getter_body') }),
          format(
            [[
              {
                get: ()<type> =>> <get_body>,
                set: (<value><type>) =>> <set_body>,
              }
            ]],
            {
              type = insert_node(1, ''),
              get_body = block_or_statement_node(2, 'getter_body'),
              value = insert_node(3, 'value'),
              set_body = block_or_statement_node(4, 'setter_body'),
            },
            { repeat_duplicate = true }
          ),
        }, { restore_cursor = true }),
      }),
      {
        condition = line_end,
      }
    ),

    snippet(
      {
        trig = 'defineProps',
        descr = 'define properties macro',
      },
      vim.deepcopy(define_props_node),
      {
        condition = line_end,
      }
    ),

    snippet(
      {
        trig = 'withDefaults',
        descr = 'properties with defaults macro',
      },
      format(
        [[
          withDefaults(<define_props>, {
            <defaults>
          })
        ]],
        {
          define_props = snippet_node(1, vim.deepcopy(define_props_node)),
          defaults = insert_node(2, '// TODO'),
        }
      ),
      {
        condition = line_end,
      }
    ),

    snippet(
      {
        trig = '^watch',
        regTrig = true,
        descr = 'explicit watcher',
      },
      format('<watch>(<source>, <callback><options>)', {
        watch = insert_node(
          1,
          'watch',
          get_node_options_with_lsp_code_action_callback('Vue Language Server', 'import from "vue"')
        ),
        source = insert_node(2, 'source'),
        callback = choice_node(3, {
          format('(<new_value>) =>> <body>', {
            new_value = insert_node(1, ''),
            body = choice_node(2, {
              format('{<>}', { restore_node(1, 'callback_body') }),
              restore_node(1, 'callback_body'),
            }, { restore_cursor = true }),
          }),
          insert_node(nil, 'callback'),
        }),
        options = choice_node(4, {
          text_node(''),
          format(', { <> }', { insert_node(1, 'immediate: true') }),
        }),
      }),
      {
        condition = line_end,
      }
    ),

    multi_snippet(
      {
        common = {
          regTrig = true,
          descr = 'component lifecycle hook',
          condition = line_end,
        },
        '^onBeforeMount',
        '^onMounted',
        '^onActivated',
        '^onBeforeUpdate',
        '^onUpdated',
        '^onDeactivated',
        '^onUnmounted',
      },
      format('<keyword>(<callback>)', {
        keyword = trigger_name_node(),
        callback = choice_node(1, {
          insert_node(nil, 'callback'),
          format('() =>> <body>', {
            body = choice_node(1, {
              format('{<>}', { restore_node(1, 'callback_body') }),
              restore_node(nil, 'callback_body'),
            }),
          }),
        }),
      })
    ),
  }
