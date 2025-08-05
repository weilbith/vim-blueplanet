local get_configuration = require('lsp.start.configuration').get_configuration
local get_client_response_handlers = require('lsp.start.middleware').get_client_response_handlers

--- Basic checks if the server should or can be started.
--- Therefore, is verifies if there is a root directory configured. This
--- simplifies the setup of servers as roots are often determined by a specific
--- configuration file that must exist or similar. If such could not be found,
--- there is no root directory and in result the server should be started.
--- Furthermore, this also checks if the server command is actually executable
--- in the current environment.
---
--- @param start_options table see vim.lsp.start options
--- @return boolean
local function should_start_server(start_options)
  local has_root_directory = start_options.root_dir ~= nil and #start_options.root_dir > 0
  local command_is_executable = vim.fn.executable(start_options.cmd[1]) == 1

  if not command_is_executable then
    local message = 'Language server "' .. start_options.name .. '" is not available.'
    vim.notify_once(message, vim.log.levels.INFO)
  end

  return has_root_directory and command_is_executable
end

--- This merges all relevant options for starting the server. Therefore it loads
--- globally configured options, as well as options for this file type.
--- Furthermore it assembles the middleware configuration based on global and
--- file-type specific handlers. Finally everything gets merged with the given
--- configuration for the specific server itself.
---
--- This mechanism allows to configure language server and client in
--- a decentralized/decoupled manner where any plugin or part of the NeoVim
--- configuration can inject its options or logic.
---
--- @param custom_configuration? table
--- @param file_type? string file-type of active buffer per default
local function build_start_options(custom_configuration, file_type)
  file_type = file_type or vim.bo[0].ft

  local middleware_handler_configuration = {
    handlers = get_client_response_handlers(file_type),
  }

  return vim.tbl_deep_extend(
    'force',
    -- Rank middleware handler configuration highest as it uses a meta-table and
    -- the other configuration might access the handlers too (e.g. `before_init`
    -- hooks)
    middleware_handler_configuration,
    get_configuration(file_type),
    custom_configuration or {}
  )
end

--- Wrapper around `vim.lsp.start` which applies some checks as well as merges
--- the different configuration levels and middleware.
---
--- @param start_options table see vim.lsp.start options
--- @return nil
return function(start_options)
  if should_start_server(start_options) then
    local full_start_options = build_start_options(start_options)
    vim.lsp.start(full_start_options)
  end
end
