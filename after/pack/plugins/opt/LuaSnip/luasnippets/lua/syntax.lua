local snippet = require('luasnip').snippet
local format = require('luasnip.extras.fmt').fmta
local text_node = require('luasnip').text_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node
local line_begin = require('luasnip.extras.conditions.expand').line_begin
local line_end = require('luasnip.extras.conditions.show').line_end

local fix_closing_character_callbacks =
  require('snippets.callbacks').fix_closing_character_callbacks
local trigger_name_node = require('snippets.nodes.general').trigger_name_node
local selected_text_node = require('snippets.nodes.general').selected_text_node

local named_function_node = format('<keyword><name>(<parameter>)\n  <body>\nend', {
  keyword = trigger_name_node('function ', ' '),
  name = insert_node(1, 'name'),
  parameter = insert_node(2),
  body = selected_text_node(3, "error('TODO')"),
})

local annonymous_function_node = format('<keyword><parameter>)\n  <body>\nend', {
  keyword = trigger_name_node('function(', '('),
  parameter = insert_node(1),
  body = selected_text_node(2, "error('TODO')"),
})

local else_node = format('<keyword>\n  <body>\n', {
  keyword = trigger_name_node('else'),
  body = selected_text_node(1, "error('TODO')"),
})

local elseif_node = nil
elseif_node = format('<keyword><condition> then\n  <body>\n<continuation>', {
  keyword = trigger_name_node('elseif '),
  condition = insert_node(1, 'true'),
  body = selected_text_node(2, "error('TODO')"),
  continuation = choice_node(3, {
    text_node(''),
    vim.deepcopy(else_node),
    vim.deepcopy(elseif_node),
  }),
})

local if_node = format('<keyword><condition> then\n  <body>\n<continuation>', {
  keyword = trigger_name_node('if '),
  condition = insert_node(1, 'true'),
  body = selected_text_node(2, "error('TODO')"),
  continuation = choice_node(3, {
    text_node('end'),
    vim.deepcopy(else_node),
    vim.deepcopy(elseif_node),
  }),
})

return nil,
  {
    snippet('function ', vim.deepcopy(named_function_node), { condition = line_end }),
    snippet(
      { trig = '[= ]function%(', regTrig = true },
      annonymous_function_node,
      { callbacks = fix_closing_character_callbacks, condition = line_end }
    ),
    snippet('if', if_node, { condition = line_begin * line_end }),
    snippet('else', else_node, { condition = line_begin * line_end }),
    snippet('elseif', elseif_node, { condition = line_begin * line_end }),
  }
