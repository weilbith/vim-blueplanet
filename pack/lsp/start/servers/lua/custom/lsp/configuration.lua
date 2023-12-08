local ALL_FILE_TYPES = require('custom.lsp.constants').ALL_FILE_TYPES

--- @class ConfigurationKind
--- Values must be equal to their key for better usage.
--- They also match exactly the keys for the configuration to start a client.
local ConfigurationKind = {
  capabilities = 'capabilities',
  settings = 'settings',
  commands = 'commands',
}

function ConfigurationKind:is_valid_kind(kind)
  return vim.tbl_contains(self, kind)
end

local storage = {}

--- @param kind string | ConfigurationKind - kind of configuration
--- @param data table - according to vim.lsp.start_client
--- @param file_type string | nil - apply configuration for this file type only, all by default
local function add_configuration(kind, data, file_type)
  if not ConfigurationKind:is_valid_kind(kind) then
    error('Can not set LSP configuration for incorrect kind: ' .. kind)
  end

  file_type = file_type or ALL_FILE_TYPES

  if storage[file_type] == nil then
    storage[file_type] = {}
  end

  local current_data = storage[file_type][kind] or {}
  local new_data = vim.tbl_deep_extend('force', current_data, data)
  storage[file_type][kind] = new_data
end

--- @param kind string | ConfigurationKind - kind of configuration
--- @param file_type string | nil - get configuration for this file type only, all by default
local function get_configuration_for_kind(kind, file_type)
  if not ConfigurationKind:is_valid_kind(kind) then
    error('Can not get LSP configuration for incorrect kind: ' .. kind)
  end

  file_type = file_type or ALL_FILE_TYPES

  local base_configuration = kind == ConfigurationKind.capabilities
      and vim.lsp.protocol.make_client_capabilities()
    or {}

  local all_filetypes_configuration = (storage[ALL_FILE_TYPES] or {})[kind] or {}
  local language_specific_configuration = (storage[file_type] or {})[kind] or {}

  return vim.tbl_deep_extend(
    'force',
    base_configuration,
    all_filetypes_configuration,
    language_specific_configuration
  )
end

--- @param file_type string | nil - get configuration for this file type only, all by default
local function get_configuration(file_type)
  local options = {}

  file_type = file_type or ALL_FILE_TYPES

  for _, kind in pairs(ConfigurationKind) do
    options[kind] = get_configuration_for_kind(kind, file_type)
  end

  return options
end

return {
  add_configuration = add_configuration,
  get_configuration = get_configuration,
  ConfigurationKind = ConfigurationKind,
}
