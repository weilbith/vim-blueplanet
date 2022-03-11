local function command_is_executable(command)
  return vim.fn.executable(command) == 1
end

local function get_base_configuration(command)
  return {
    runtime_condition = function()
      return command_is_executable(command)
    end
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

require('null-ls').setup()
register_source('formatting', 'black')
register_source('formatting', 'isort')

--   sources = {
--     -- diagnostics.deadnix,
--     -- diagnostics.mypy,
--     -- -- formatting.rustfmt,
--     -- formatting.prettier,
--     formatting.shellharden.with(get_configuration('sheel')),
--     formatting.black.with(get_configuration('black')),
--     formatting.isort.with(get_configuration('isort')),
--     formatting.latexindent.with(get_configuration('latexindent')),
--     formatting.nixfmt.with(get_configuration('nixfmt')),
--     formatting.nginx_beautifier.with(get_configuration('nginxbeautifier')),
--   },
-- })
