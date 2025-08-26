---@param method string actually this is of type GlanceMethod
local function create_switch_to_method_callback(method)
  return function()
    local actions = require('glance').actions
    actions.close()
    actions.open(method)
  end
end

vim.keymap.set(
  'n',
  'r',
  create_switch_to_method_callback('references'),
  { buffer = true, desc = 'switch to peek references' }
)

vim.keymap.set(
  'n',
  'i',
  create_switch_to_method_callback('implementations'),
  { buffer = true, desc = 'switch to peek implementations' }
)

vim.keymap.set(
  'n',
  't',
  create_switch_to_method_callback('type_definitions'),
  { buffer = true, desc = 'switch to peek type definitions' }
)

vim.keymap.set(
  'n',
  'd',
  create_switch_to_method_callback('definitions'),
  { buffer = true, desc = 'switch to peek definitions' }
)
