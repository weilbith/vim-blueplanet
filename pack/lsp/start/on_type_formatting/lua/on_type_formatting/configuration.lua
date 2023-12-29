local encoding = require('on_type_formatting.encoding')

local function number_of_entries_in_table(tbl)
  local count = 0

  for _ in pairs(tbl) do
    count = count + 1
  end

  return count
end

--- @alias BufferConfiguration table<number, string> mapping of client identifier to trigger characters

--- @param buffer number
--- @return BufferConfiguration
local function get_buffer_configuration(buffer)
  return vim.b[buffer].on_type_formatting or {}
end

--- @param buffer number
--- @param configuration BufferConfiguration
--- @return nil
local function set_buffer_configuration(buffer, configuration)
  local configuration_without_nil = vim.tbl_filter(function(entry)
    return entry ~= vim.NIL
  end, configuration)

  local has_non_nil_entries = #configuration_without_nil > 0
  configuration = has_non_nil_entries and configuration or {}

  vim.b[buffer].on_type_formatting = configuration
end

--- @param client table
--- @return string
local function get_trigger_characters(client)
  local capabilities = client.server_capabilities or {}
  local options = capabilities.documentOnTypeFormattingProvider or {}
  local trigger_characters = options.firstTriggerCharacter or ''
  trigger_characters = trigger_characters .. table.concat(options.moreTriggerCharacter or {})
  return encoding.encode_json_escape_sequences_as_terminal_codes(trigger_characters)
end

--- If the client has support for on type formatting, the trigger characters
--- will be added to the configured attached to the buffer the client is
--- attached to.
---
--- @param client_identifier number
--- @param buffer number
--- @return nil
local function maybe_add_configuration_for_client(client_identifier, buffer)
  local client = vim.lsp.get_client_by_id(client_identifier) or {}
  local trigger_characters = get_trigger_characters(client)

  if #trigger_characters > 0 then
    local configuration = get_buffer_configuration(buffer)
    configuration[client.id] = trigger_characters
    set_buffer_configuration(buffer, configuration)
  end
end

local function any_buffer_has_non_empty_configuration()
  for _, buffer in pairs(vim.api.nvim_list_bufs()) do
    local configuration = get_buffer_configuration(buffer)
    local not_empty = number_of_entries_in_table(configuration) > 0

    if not_empty then
      return true
    end
  end

  return false
end

--- If the client had support for on type formatting, its associated trigger
--- characters gets removed from the buffer configuration the client was
--- attached to.
---
--- @param client_identifier number
--- @param buffer number
--- @return nil
local function maybe_remove_configuration_for_client(client_identifier, buffer)
  local configuration = get_buffer_configuration(buffer)
  configuration[client_identifier] = nil
  set_buffer_configuration(buffer, configuration)
end

return {
  get_buffer_configuration = get_buffer_configuration,
  maybe_add_configuration_for_client = maybe_add_configuration_for_client,
  maybe_remove_configuration_for_client = maybe_remove_configuration_for_client,
  any_buffer_has_non_empty_configuration = any_buffer_has_non_empty_configuration,
}
