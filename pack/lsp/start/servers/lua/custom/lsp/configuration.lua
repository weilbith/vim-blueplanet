local ALL_FILE_TYPES = require('custom.lsp.constants').ALL_FILE_TYPES

--- @class ConfigurationKind
--- Values must be equal to their key for better usage.
--- They also match exactly the keys for the configuration to start a client.
local ConfigurationKind = {
  capabilities = 'capabilities',
  settings = 'settings',
  commands = 'commands',
  before_init = 'before_init',
}

local ConfigurationKindLuaType = {
  [ConfigurationKind.capabilities] = 'table',
  [ConfigurationKind.settings] = 'table',
  [ConfigurationKind.commands] = 'table',
  [ConfigurationKind.before_init] = 'function',
}

local function check_for_valid_configuration_kind(kind)
  if not vim.tbl_contains(ConfigurationKind, kind) then
    error('Can not set LSP configuration for incorrect kind: ' .. kind)
  end
end

local function check_for_valid_configuration_data_type(kind, data)
  local expected_type = ConfigurationKindLuaType[kind]
  local actual_type = type(data)

  if actual_type ~= expected_type then
    error(
      'Can not set LSP configuration with unexpected Lua type. Expected '
        .. expected_type
        .. ' but was '
        .. actual_type
    )
  end
end

--- @vararg table
--- @return table
local function merge_tables(...)
  return vim.tbl_deep_extend('force', ...)
end

--- @vararg function
--- @return function
local function merge_functions(...)
  local functions = { ... }

  return function(...)
    for _, single_function in pairs(functions) do
      single_function(...)
    end
  end
end

local MergeFunctionsPerLuaType = {
  ['table'] = merge_tables,
  ['function'] = merge_functions,
}

local DefaultDataPerLuaType = {
  ['table'] = {},
  ['function'] = function() end,
}

--- @param kind string | ConfigurationKind
--- @return table | function
local function get_default_value_for_kind(kind)
  local lua_type = ConfigurationKindLuaType[kind]
  return DefaultDataPerLuaType[lua_type]
end

--- @generic T
--- @param kind string | ConfigurationKind
--- @vararg T
--- @return T
local function merge_data_for_kind(kind, ...)
  local lua_type = ConfigurationKindLuaType[kind]
  local merge_function = MergeFunctionsPerLuaType[lua_type]
  return merge_function(...)
end

local storage = {}

--- @param kind string | ConfigurationKind - kind of configuration
--- @param data table - according to vim.lsp.start_client
--- @param file_type string? - apply configuration for this file type only, all by default
local function add_configuration(kind, data, file_type)
  check_for_valid_configuration_kind(kind)
  check_for_valid_configuration_data_type(kind, data)

  file_type = file_type or ALL_FILE_TYPES

  if storage[file_type] == nil then
    storage[file_type] = {}
  end

  local default = get_default_value_for_kind(kind)
  local current_data = storage[file_type][kind] or default
  local new_data = merge_data_for_kind(kind, current_data, data)
  storage[file_type][kind] = new_data
end

--- @param kind string | ConfigurationKind - kind of configuration
--- @param file_type string? - get configuration for this file type only, all by default
local function get_configuration_for_kind(kind, file_type)
  check_for_valid_configuration_kind(kind)

  file_type = file_type or ALL_FILE_TYPES

  local default = get_default_value_for_kind(kind)
  local base_configuration = kind == ConfigurationKind.capabilities
      and vim.lsp.protocol.make_client_capabilities()
    or default

  local all_filetypes_configuration = (storage[ALL_FILE_TYPES] or {})[kind] or default
  local language_specific_configuration = (storage[file_type] or {})[kind] or default
  return merge_data_for_kind(
    kind,
    base_configuration,
    all_filetypes_configuration,
    language_specific_configuration
  )
end

--- @param file_type string? - get configuration for this file type only, all by default
local function get_configuration(file_type)
  local options = {}

  file_type = file_type or ALL_FILE_TYPES

  for _, kind in pairs(ConfigurationKind) do
    if kind ~= 'efore_init' then
      options[kind] = get_configuration_for_kind(kind, file_type)
    end
  end

  return options
end

return {
  add_configuration = add_configuration,
  get_configuration = get_configuration,
  ConfigurationKind = ConfigurationKind,
}
