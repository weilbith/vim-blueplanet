--- @see enable_all_clients_with_installed_server

--- List of client names based on LSP configuration files in the runtime path.
--- See `:help lsp-new-config`
---
--- @return string[] client_names
local function get_list_of_client_names()
  return vim
    .iter(vim.api.nvim_get_runtime_file('lsp/*.lua', true))
    :map(function(path)
      return vim.fn.fnamemodify(path, ':t:r')
    end)
    :totable()
end

--- Checks if the configured server command for a client is executable.
--- This makes the assumption, that the first entry in the command argument list
--- is the executable. If there should be any "fancy" commands, this does not
--- work as expected.
---
--- @param client_name string
--- @return boolean is_executable
local function can_server_of_client_be_started(client_name)
  local configuration = vim.lsp.config[client_name] or {}
  local command = configuration.cmd or {}
  return #command > 0 and vim.fn.executable(command[1]) == 1
end

--- Automatically enable configured clients that can be used.
---
--- This makes use of LSP configuration files, available for all language
--- servers of personal use, but only enable those which are available in the
--- currently active development environment. It allows to keep configuration
--- files cleanly organized and avoid errors by NeoVim for unavailable servers.
---
--- @return nil
local function enable_all_clients_with_installed_server()
  vim.iter(get_list_of_client_names()):filter(can_server_of_client_be_started):each(vim.lsp.enable)
end

enable_all_clients_with_installed_server()
