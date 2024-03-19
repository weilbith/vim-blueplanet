local multi_snippet = require('luasnip').multi_snippet
local format = require('luasnip.extras.fmt').fmta
local insert_node = require('luasnip').insert_node
local function_node = require('luasnip').function_node
local new_key = require('luasnip.nodes.key_indexer').new_key
local line_begin = require('luasnip.extras.conditions.expand').line_begin
local line_end = require('luasnip.extras.conditions.show').line_end

local trigger_text_insert_node = require('snippets.nodes.general').trigger_text_insert_node
local get_node_options_with_lsp_code_action_callback = require(
  'snippets.callbacks.lsp_code_actions'
).get_node_options_with_lsp_code_action_callback

return nil,
  {
    multi_snippet(
      {
        {
          trig = 'useEffect',
          snippetType = 'snippet',
          descr = 'synchronize with an external system',
        },
        {
          trig = 'useEffect',
          snippetType = 'autosnippet',
          descr = 'synchronize with an external system',
        },
        { trig = 'useLayoutEffect', snippetType = 'snippet', descr = 'define a layout effect' },
        {
          trig = 'useLayoutEffect',
          snippetType = 'autosnippet',
          descr = 'define a layout effect',
        },
        { trig = 'useCallback', snippetType = 'snippet', descr = 'cache a function' },
        { trig = 'useCallback', snippetType = 'autosnippet', descr = 'cace a function' },
        { trig = 'useMemo', snippetType = 'snippet', descr = 'cache result of a computation' },
        {
          trig = 'useMemo',
          snippetType = 'autosnippet',
          descr = 'cache result of a computation',
        },
      },
      format(
        [[
          <hook_name>(() =>> {
            <callback>
          }, [<dependencies>])
        ]],
        {
          hook_name = trigger_text_insert_node(
            1,
            get_node_options_with_lsp_code_action_callback(
              'TypeScript Language Server',
              'import from "react"',
              { wait_for_diagnostics = true }
            )
          ),
          callback = insert_node(2, '// TODO'),
          dependencies = insert_node(
            3,
            '',
            get_node_options_with_lsp_code_action_callback(
              'eslint',
              'Update.*react%-hooks%/exhaustive%-deps'
            )
          ),
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
        { trig = 'useContext', snippetType = 'snippet', descr = 'subscribe to context' },
        { trig = 'useContext', snippetType = 'autosnippet', descr = 'subscribe to context' },
        {
          trig = 'useDeferredValue',
          snippetType = 'snippet',
          descr = 'value that defers UI updates',
        },
        {
          trig = 'useDeferredValue',
          snippetType = 'autosnippet',
          descr = 'value that defers UI updates',
        },
      },
      format('const <name> = <hook_name>(<parameter>)', {
        hook_name = trigger_text_insert_node(
          1,
          get_node_options_with_lsp_code_action_callback(
            'TypeScript Language Server',
            'import from "react"'
          )
        ),
        name = insert_node(2, 'name'),
        parameter = insert_node(3, 'parameter'),
      }),
      {
        common_opts = {
          condition = line_begin * line_end,
        },
      }
    ),
    multi_snippet(
      {
        { trig = 'useId', snippetType = 'snippet', descr = 'create accessibility identifier' },
        {
          trig = 'useId',
          snippetType = 'autosnippet',
          descr = 'create accessibility identifier',
        },
      },
      format('const <name> = <hook_name>()', {
        hook_name = trigger_text_insert_node(
          1,
          get_node_options_with_lsp_code_action_callback(
            'TypeScript Language Server',
            'import from "react"'
          )
        ),
        name = insert_node(2, 'name'),
      }),
      {
        common_opts = {
          condition = line_begin * line_end,
        },
      }
    ),
    multi_snippet(
      {
        { trig = 'useState', snippetType = 'snippet', descr = 'define a state variable' },
        { trig = 'useState', snippetType = 'autosnippet', descr = 'define a state variable' },
      },
      format('const [<name>, <setter>] = <hook_name>(<initial_value>)', {
        hook_name = trigger_text_insert_node(
          1,
          get_node_options_with_lsp_code_action_callback(
            'TypeScript Language Server',
            'import from "react"'
          )
        ),
        name = insert_node(2, 'name', { key = 'name' }),
        setter = function_node(function(args)
          local name = args[1][1]
          local sentence_case_name = name:sub(1, 1):upper() .. name:sub(2)
          return 'set' .. sentence_case_name
        end, new_key('name')),
        initial_value = insert_node(3, '0'),
      }),
      {
        common_opts = {
          condition = line_begin * line_end,
        },
      }
    ),
    multi_snippet(
      {
        {
          trig = 'useImperativeHandle',
          snippetType = 'snippet',
          descr = 'customized exposed ref handle',
        },
        {
          trig = 'useImperativeHandle',
          snippetType = 'autosnippet',
          descr = 'customized exposed ref handle',
        },
      },
      format(
        [[
          <hook_name>(<ref>, () =>> ({
            <handle>
          }), [<dependencies>])
        ]],
        {
          hook_name = trigger_text_insert_node(
            1,
            get_node_options_with_lsp_code_action_callback(
              'TypeScript Language Server',
              'import from "react"'
            )
          ),
          ref = insert_node(2, 'ref'),
          handle = insert_node(3, '// TODO'),
          dependencies = insert_node(
            4,
            '',
            get_node_options_with_lsp_code_action_callback(
              'eslint',
              'Update.*react%-hooks%/exhaustive%-deps'
            )
          ),
        }
      ),
      {
        common_opts = {
          condition = line_begin * line_end,
        },
      }
    ),
  }
