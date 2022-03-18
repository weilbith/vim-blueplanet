local null_ls = require('null-ls')

local function command_is_executable(command)
  return vim.fn.executable(command) == 1
end

local function get_base_configuration(command)
  return {
    runtime_condition = function()
      return command_is_executable(command)
    end,
  }
end

local function register_source(type, name, additional_configuration)
  local path = string.format('null-ls.builtins.%s.%s', type, name)
  local source = require(path)
  local command = source._opts.command
  local base_configuration = get_base_configuration(command)
  local full_configuration = vim.tbl_deep_extend(
    'force',
    base_configuration,
    additional_configuration or {}
  )

  local configured_source = source.with(full_configuration)
  require('null-ls.sources').register(configured_source)
end

null_ls.register_source = register_source

return null_ls
