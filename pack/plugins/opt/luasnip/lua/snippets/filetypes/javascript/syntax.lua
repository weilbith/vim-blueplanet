local snippet = require('luasnip').snippet
local snippet_node = require('luasnip').snippet_node
local format = require('luasnip.extras.fmt').fmta
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node
local dynamic_node = require('luasnip').dynamic_node

local fix_closing_character_callbacks =
  require('snippets.callbacks').fix_closing_character_callbacks
local trigger_name_node = require('snippets.utilitiy_nodes').trigger_name_node
local selected_text_node = require('snippets.utilitiy_nodes').selected_text_node
local file_name_node = require('snippets.utilitiy_nodes').file_name_node

local get_return_type_node = require('snippets.filetypes.javascript.utils').get_return_type_node

local class_node = format('<keyword><name> {\n  constructor(<parameter>) {\n    <body>\n  }\n}', {
  keyword = trigger_name_node('class', ' '),
  name = file_name_node(1, 'Name'),
  parameter = insert_node(2),
  body = insert_node(3, '// TODO'),
})

local named_function_node = format('<keyword><name>(<parameter>)<return_type> {\n  <body>\n}', {
  keyword = trigger_name_node('function '),
  name = insert_node(1, 'name'),
  parameter = insert_node(2),
  return_type = get_return_type_node(3),
  body = selected_text_node(4, '// TODO'),
})

local annonymous_function_node = format('<keyword><parameter>)<return_type> {\n  <body>\n}', {
  keyword = trigger_name_node('function(', '('),
  parameter = insert_node(1),
  return_type = get_return_type_node(2),
  body = selected_text_node(3, '// TODO'),
})

local asynchronous_anonymous_function_node = format('<keyword><parameter>) =>> { <body> }', {
  keyword = trigger_name_node('async (', '('),
  parameter = insert_node(1),
  body = selected_text_node(2, '/* TODO */'),
})

local if_node = format('<keyword><condition>) {\n  <body>\n}', {
  keyword = trigger_name_node('if (', '('),
  condition = insert_node(1, 'true'),
  body = selected_text_node(2, '// TODO'),
})

local else_node = format('<keyword><continuation>', {
  keyword = trigger_name_node('else ', ' '),
  continuation = choice_node(1, {
    snippet_node(nil, format('{\n  <body>\n}', { body = insert_node(1, '// TODO') })),
    vim.deepcopy(if_node),
  }),
})

local function get_case_node(index)
  return dynamic_node(index, function()
    return snippet_node(
      nil,
      format('<keyword><condition>:\n  <body>\n  break;\n<continuation>', {
        keyword = trigger_name_node('case', ' '),
        condition = insert_node(1, 'condition'),
        body = insert_node(2, '// TODO'),
        continuation = choice_node(3, {
          text_node({ 'default:' }, { '  ' }),
        }),
      })
    )
  end, {})
end

local switch_case_node = format('<keyword><expression>) {\n  <case>\n}', {
  keyword = trigger_name_node('switch ', '('),
  expression = insert_node(1, 'expression'),
  case = get_case_node(2),
})

return {
  autosnippets = {
    snippet({ trig = '^class ', regTrig = true }, class_node),
    snippet({ trig = '^function ', regTrig = true }, vim.deepcopy(named_function_node)),
    snippet({ trig = ' function ' }, vim.deepcopy(named_function_node)),
    snippet(
      { trig = '[= ]function%(', regTrig = true },
      annonymous_function_node,
      { callbacks = fix_closing_character_callbacks }
    ),
    snippet(
      'async (',
      asynchronous_anonymous_function_node,
      { callbacks = fix_closing_character_callbacks }
    ),
    snippet(
      { trig = ' if[%( ]', regTrig = true },
      if_node,
      { callbacks = fix_closing_character_callbacks }
    ),
    snippet(
      { trig = '[} ]else ', regTrig = true },
      else_node,
      { callbacks = fix_closing_character_callbacks }
    ),
    snippet(' switch ', switch_case_node),
  },
}
