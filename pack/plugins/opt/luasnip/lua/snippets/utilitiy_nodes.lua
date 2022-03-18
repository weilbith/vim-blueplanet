local snippet_node = require('luasnip').snippet_node
local insert_node = require('luasnip').insert_node
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
  end, {})
end

local function selected_text_node(index, default_selected_text)
  default_selected_text = default_selected_text or ''

  return dynamic_node(index, function(_, parent)
    local selected_text = (parent.env or {}).TM_SELECTED_TEXT or {}
    local text = #selected_text > 0 and selected_text or default_selected_text
    return snippet_node(nil, { insert_node(1, text) })
  end, {})
end

local function file_name_node(index, default_file_name)
  default_file_name = default_file_name or ''

  return dynamic_node(index, function(_, parent)
    local file_name = (parent.env or {}).TM_FILENAME or default_file_name
    local core_name = file_name:match('^([%a_-]+)%.?')

    return snippet_node(nil, { insert_node(1, core_name) })
  end, {})
end

return {
  trigger_name_node = trigger_name_node,
  selected_text_node = selected_text_node,
  file_name_node = file_name_node,
}
