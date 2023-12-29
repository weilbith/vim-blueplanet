local configuration = require('on_type_formatting.configuration')
local request = require('on_type_formatting.request')

local on_key_namespace_identifier = nil

--- @return boolean
local function is_in_insert_mode()
  return vim.api.nvim_get_mode().mode == 'i'
end

--- @param key string
--- @param trigger_characters string
--- @return boolean
local function is_trigger_character(key, trigger_characters)
  local escaped_pattern = vim.pesc(key)
  return string.match(trigger_characters, escaped_pattern) ~= nil
end

--- @param key string
--- @return nil
local function on_key_handler(key)
  if not is_in_insert_mode() then
    return
  end

  local buffer_configuration = configuration.get_buffer_configuration(0)

  for client_identifier, trigger_characters in pairs(buffer_configuration) do
    if trigger_characters ~= vim.NIL and is_trigger_character(key, trigger_characters) then
      request.trigger_on_key_formatting(key, client_identifier)
    end
  end
end

local function maybe_establish_key_listener()
  local should_establish = on_key_namespace_identifier == nil
    and configuration.any_buffer_has_non_empty_configuration()

  if should_establish then
    on_key_namespace_identifier = vim.on_key(on_key_handler, nil)
  end
end

local function maybe_remove_key_listener()
  local should_remove = on_key_namespace_identifier ~= nil
    and not configuration.any_buffer_has_non_empty_configuration()

  if should_remove then
    vim.on_key(nil, on_key_namespace_identifier)
    on_key_namespace_identifier = nil
  end
end

return {
  maybe_establish_key_listener = maybe_establish_key_listener,
  maybe_remove_key_listener = maybe_remove_key_listener,
}
