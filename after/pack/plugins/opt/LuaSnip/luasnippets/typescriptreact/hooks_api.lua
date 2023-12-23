local multi_snippet = require('luasnip').multi_snippet
local format = require('luasnip.extras.fmt').fmta
local insert_node = require('luasnip').insert_node
local function_node = require('luasnip').function_node
local new_key = require('luasnip.nodes.key_indexer').new_key
local line_begin = require('luasnip.extras.conditions.expand').line_begin
local line_end = require('luasnip.extras.conditions.show').line_end
local events = require('luasnip.util.events')

local trigger_text_insert_node = require('snippets.nodes.general').trigger_text_insert_node
local get_lsp_code_action_callback =
  require('snippets.callbacks.lsp_code_actions').get_lsp_code_action_callback

return nil,
  {
    multi_snippet(
      {
        common = { descr = 'define hooks with a callback' },
        { trig = 'useEffect', snippetType = 'snippet' },
        { trig = 'useEffect', snippetType = 'autosnippet' },
        { trig = 'useLayoutEffect', snippetType = 'snippet' },
        { trig = 'useLayoutEffect', snippetType = 'autosnippet' },
      },
      format(
        [[
          <hook_name>(() =>> {
            <callback>
          }, [<dependencies>])
        ]],
        {
          hook_name = trigger_text_insert_node(1, {
            node_callbacks = {
              [events.enter] = get_lsp_code_action_callback(
                'TypeScript Language Server',
                'import from "react"',
                { wait_for_diagnostics = true }
              ),
            },
          }),
          callback = insert_node(2, '// TODO'),
          dependencies = insert_node(3, '', {
            node_callbacks = {
              [events.enter] = get_lsp_code_action_callback(
                'eslint',
                'Update.*react%-hooks%/exhaustive%-deps'
              ),
            },
          }),
        }
      ),
      {
        common_opts = {
          condition = line_begin * line_end,
        },
      }
    ),
    multi_snippet(
      {
        common = { descr = 'define some state' },
        { trig = 'useState', snippetType = 'snippet' },
        { trig = 'useState', snippetType = 'autosnippet' },
      },
      format('const [<name>, <setter>] = <hook_name>(<initial_value>)', {
        name = insert_node(1, 'name', { key = 'name' }),
        setter = function_node(function(args)
          local name = args[1][1]
          local sentence_case_name = name:sub(1, 1):upper() .. name:sub(2)
          return 'set' .. sentence_case_name
        end, new_key('name')),
        hook_name = trigger_text_insert_node(2, {
          node_callbacks = {
            [events.enter] = get_lsp_code_action_callback(
              'TypeScript Language Server',
              'import from "react"'
            ),
          },
        }),
        initial_value = insert_node(3, '0'),
      }),
      {
        common_opts = {
          condition = line_begin * line_end,
        },
      }
    ),
  }
