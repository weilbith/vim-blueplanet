local encoding = require('on_type_formatting.encoding')

--- @alias BufferConfiguration table<number, string> mapping of LSP client
--- identifier to registered trigger characters. Trigger characters must be
--- encoded as terminal codes for fast comparison on key strokes.

--- @param buffer_number number
--- @return BufferConfiguration configuration empty if buffer has no LSP client
--- attached with matching capability or any trigger characters are registered
local function get_configuration_for_buffer(buffer_number)
  return vim.b[buffer_number].configuration_for_lsp_on_type_formatting or {}
end

--- @param buffer_number number
--- @param configuration BufferConfiguration will be filtered for empty values
--- @return nil
local function set_configuration_for_buffer(buffer_number, configuration)
  local clean_configuration = {}

  for client_identifier, trigger_characters in pairs(configuration) do
    local has_trigger_characters = trigger_characters ~= vim.NIL
      and type(trigger_characters) == 'string'
      and #trigger_characters > 0

    if has_trigger_characters then
      clean_configuration[client_identifier] = trigger_characters
    end
  end

  vim.b[buffer_number].configuration_for_lsp_on_type_formatting = clean_configuration
end

--- @param client_identifier number
--- @return string trigger_characters encoded as terminal codes; empty if
--- unsupported or none registered
local function read_trigger_characters_of_client(client_identifier)
  local client = vim.lsp.get_client_by_id(client_identifier) or {}
  local capabilities = client.server_capabilities or {}
  local provider = capabilities.documentOnTypeFormattingProvider or {}
  local trigger_characters = provider.firstTriggerCharacter or ''
  trigger_characters = trigger_characters .. table.concat(provider.moreTriggerCharacter or {})
  return encoding.decode_terminal_codes_from_json_escape_sequences(trigger_characters)
end

--- @param client_identifier number
--- @param buffer_number number
--- @return nil
local function add_configuration_for_client(client_identifier, buffer_number)
  local configuration = get_configuration_for_buffer(buffer_number)
  configuration[client_identifier] = read_trigger_characters_of_client(client_identifier)
  set_configuration_for_buffer(buffer_number, configuration)
end

--- @param client_identifier number
--- @param buffer_number number
--- @return nil
local function remove_configuration_for_client(client_identifier, buffer_number)
  local configuration = get_configuration_for_buffer(buffer_number)
  configuration[client_identifier] = nil
  set_configuration_for_buffer(buffer_number, configuration)
end

--- @return boolean
local function has_any_buffer_trigger_characters_configured()
  return vim.iter(vim.api.nvim_list_bufs()):any(function(buffer_number)
    local configuration = get_configuration_for_buffer(buffer_number)
    return not vim.tbl_isempty(configuration)
  end)
end

return {
  get_configuration_for_buffer = get_configuration_for_buffer,
  add_configuration_for_client = add_configuration_for_client,
  remove_configuration_for_client = remove_configuration_for_client,
  has_any_buffer_trigger_characters_configured = has_any_buffer_trigger_characters_configured,
}
