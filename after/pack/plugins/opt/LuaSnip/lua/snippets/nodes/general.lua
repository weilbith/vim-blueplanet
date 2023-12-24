local snippet_node = require('luasnip').snippet_node
local text_node = require('luasnip').insert_node
local insert_node = require('luasnip').insert_node
local choice_node = require('luasnip').choice_node
local function_node = require('luasnip').function_node
local dynamic_node = require('luasnip').dynamic_node

local function trigger_name_node(default_name, required_last_character)
  default_name = default_name or ''
  required_last_character = required_last_character or ''

  return function_node(function(_, snip)
    local name = snip.trigger or default_name
    local last_character = name:sub(-1)

    if last_character ~= required_last_character then
      name = name .. required_last_character
    end

    return name
  end, {}, {})
end

--- @param index number
--- @param node_options table | nil
--- @return table insert_node
local function trigger_text_insert_node(index, node_options)
  node_options = node_options or {}

  return dynamic_node(index, function(_, snippet)
    return snippet_node(nil, { insert_node(1, snippet.trigger, node_options) })
  end, {})
end

local function selected_text_node(index, default_text)
  default_text = default_text or ''

  return dynamic_node(index, function(_, parent)
    local selected_text = (parent.env or {}).TM_SELECTED_TEXT or {}
    local selection_node = text_node(nil, selected_text)
    local default_node = insert_node(nil, default_text)

    if #selected_text > 0 then
      return snippet_node(nil, choice_node(1, { default_node, selection_node }))
    else
      return snippet_node(nil, default_node)
    end
  end, {})
end

local function file_name_node(index, default_file_name, sentence_case)
  default_file_name = default_file_name or ''
  sentence_case = sentence_case or false

  return dynamic_node(index, function(_, parent)
    local file_name = (parent.env or {}).TM_FILENAME or default_file_name
    local name = file_name:match('^([%a_-]+)%.?')

    if sentence_case then
      name = (name:gsub('^%l', string.upper))
    end

    return snippet_node(nil, { insert_node(1, name) })
  end, {})
end

return {
  trigger_name_node = trigger_name_node,
  trigger_text_insert_node = trigger_text_insert_node,
  selected_text_node = selected_text_node,
  file_name_node = file_name_node,
}
