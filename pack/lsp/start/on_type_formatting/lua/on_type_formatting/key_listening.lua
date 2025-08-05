local configuration = require('on_type_formatting.configuration')
local encoding = require('on_type_formatting.encoding')
local formatting = require('on_type_formatting.formatting')

local key_listener_namespace_identifier = nil

--- @return boolean
local function is_in_insert_mode()
  return vim.api.nvim_get_mode().mode == 'i'
end

--- Must be performant because it will be executed for each key stroke per
--- attached LSP client.
---
--- @param key string as terminal code
--- @param trigger_characters string as terminal codes
--- @return boolean
local function is_key_a_trigger_character(key, trigger_characters)
  local escaped_pattern = vim.pesc(key)
  return trigger_characters ~= vim.NIL and string.match(trigger_characters, escaped_pattern) ~= nil
end

--- Executed on every key stroke of the user (needs to be efficient).
--- Triggers formatting if the typed key is configured as a trigger character of
--- an attached LSP client for the current buffer.
---
--- @param key string
--- @return nil
local function on_key_handler(key)
  if not is_in_insert_mode() then
    return
  end

  local buffer_configuration = configuration.get_configuration_for_buffer(0)

  for client_identifier, trigger_characters in pairs(buffer_configuration) do
    if is_key_a_trigger_character(key, trigger_characters) then
      local trigger_character = encoding.encode_terminal_codes_as_json_escape_sequences(key)
      formatting.request_formatting(trigger_character, client_identifier)
    end
  end
end

--- There is always just one key listener for on-type-formatting purposes.
--- Register only if none exists yet and any buffer needs it.
---
--- @return nil
local function register_the_key_listener_if_needed()
  local has_on_key_listener = key_listener_namespace_identifier == nil
  local is_listener_needed = has_on_key_listener
    and configuration.has_any_buffer_trigger_characters_configured()

  if is_listener_needed then
    key_listener_namespace_identifier = vim.on_key(on_key_handler, nil)
  end
end

--- Checks if listener exists but no buffer needs it (anymore).
---
--- @return nil
local function unregister_the_key_listener_if_needless()
  local has_on_key_listener = key_listener_namespace_identifier == nil
  local is_listener_needed = has_on_key_listener
    and configuration.has_any_buffer_trigger_characters_configured()

  if not is_listener_needed then
    vim.on_key(nil, key_listener_namespace_identifier)
    key_listener_namespace_identifier = nil
  end
end

return {
  register_the_key_listener_if_needed = register_the_key_listener_if_needed,
  unregister_the_key_listener_if_needless = unregister_the_key_listener_if_needless,
}
