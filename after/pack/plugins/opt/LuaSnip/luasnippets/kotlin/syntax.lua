local snippet = require('luasnip').snippet
local snippet_node = require('luasnip').snippet_node
local multi_snippet = require('luasnip').multi_snippet
local format = require('luasnip.extras.fmt').fmta
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node
local dynamic_node = require('luasnip').dynamic_node
local restore_node = require('luasnip').restore_node
local line_begin = require('luasnip.extras.conditions.expand').line_begin
local line_end = require('luasnip.extras.conditions.show').line_end

local trigger_name_node = require('snippets.nodes.general').trigger_name_node
local file_name_node = require('snippets.nodes.general').file_name_node

local package_node = format('<keyword><path>', {
  keyword = trigger_name_node('package', ' '),
  path = dynamic_node(1, function()
    local folder_path = vim.api.nvim_call_function('expand', { '%:p:h' })
    local _, _, org_path = string.find(folder_path, '(org/.*)$')
    local _, _, com_path = string.find(folder_path, '(com/.*)$')
    local _, _, net_path = string.find(folder_path, '(net/.*)$')
    local _, _, de_path = string.find(folder_path, '(de/.*)$')
    local raw_path = org_path or com_path or net_path or de_path or 'path/of/package'
    local package_path = string.gsub(raw_path, '/', '.')

    return snippet_node(nil, { insert_node(1, package_path) })
  end, {}),
})

local function block_or_statement_node(jump_index, restore_key)
  restore_key = restore_key or 'block_or_statement'

  return choice_node(jump_index, {
    format('{\n  <>\n}', { restore_node(1, restore_key) }),
    restore_node(nil, restore_key),
  }, { restore_cursor = true })
end

local function_node = format('fun <name><rest>', {
  name = insert_node(1, ''),
  rest = dynamic_node(2, function(arguments)
    local function_name = arguments[1][1]

    -- Unfortunately there is the syntax of a `fun interface` a functional interface
    if function_name == 'interface' then
      return snippet_node(
        nil,
        format(' <name> {\n  <body>\n}', {
          name = file_name_node(1, 'Name'),
          body = insert_node(2, '// TODO'),
        }, { dedent = false })
      )
    else
      return snippet_node(
        nil,
        format('(<parameter>)<return_type> <body>', {
          parameter = insert_node(1),
          return_type = choice_node(2, {
            format(': <type>', { type = insert_node(1, 'Unit') }),
            text_node(''),
          }),
          body = choice_node(3, {
            format('{\n  <>\n}', { restore_node(1, 'body', insert_node(nil, '// TODO')) }),
            format('= <statement>', { statement = restore_node(1, 'body') }),
          }, { restore_cursor = true }),
        })
      )
    end
  end, { 1 }),
})

local when_node = format(
  [[
  when (<subject>) {
    <body>
  }
  ]],
  {
    subject = insert_node(1, 'subject'),
    body = insert_node(2, '// TODO'),
  }
)

local if_node = format('if (<condition>) <body>', {
  condition = insert_node(1, 'condition'),
  body = block_or_statement_node(2),
})

local for_node = format('for (<range_expression>) <body>', {
  range_expression = choice_node(1, {
    format('<variable> in <iterable>', {
      variable = insert_node(1, 'variable'),
      iterable = insert_node(2, 'iterable'),
    }),
    insert_node(nil, '/* TODO */'),
  }),
  body = block_or_statement_node(2),
})

local while_node = format('while (<condition>) <body>', {
  condition = insert_node(1, 'condition'),
  body = block_or_statement_node(2),
})

local companion_node = format(
  [[
    companion object {
      <body>
    }
  ]],
  { body = insert_node(1, '// TODO') }
)

local scope_node = format('<keyword><body>', {
  keyword = trigger_name_node('let', ''),
  body = choice_node(1, {
    format(' { <> }', { restore_node(1, 'body', insert_node('/* TODO */')) }, { dedent = false }),
    format('(<>)', { restore_node(1, 'body') }),
  }, { restore_cursor = true }),
})

return nil,
  {
    snippet({ trig = '^package ', regTrig = true }, package_node, { condition = line_end }),
    snippet('fun ', function_node, { condition = line_end }),
    snippet('when ', when_node, { condition = line_end }),
    snippet('if ', if_node, { condition = line_end }),
    snippet('for ', for_node, { condition = line_begin * line_end }),
    snippet('while ', while_node, { condition = line_begin * line_end }),
    snippet('companion ', companion_node, { condition = line_begin * line_end }),
    multi_snippet(
      { '.let', '.apply', { trig = '^%s*init ', regTrig = true } },
      scope_node,
      { condition = line_end }
    ),
  }
