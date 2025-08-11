--- Parse the captured arguments of a callback function for a user command into
--- an executable command again.
--- (see `:help nvim_create_user_command()` and `:help nvim_cmd()`)
---
--- @param captured_arguments table
--- @return table command
local function parse_captured_arguments_as_command(captured_arguments)
  return {
    cmd = captured_arguments.name,
    -- TODO: figure out if arguments are supported for command...
    -- range = { captured_arguments.line1, captured_arguments.line2 },
    -- count = captured_arguments.count,
    -- reg = captured_arguments.reg,
    bang = captured_arguments.bang,
    args = captured_arguments.fargs,
    -- addr = TODO (not supported?)
    -- nargs = TODO (does that make sense?)
    -- nextcmd = TODO (not supported?)
    -- magic = TODO (not supported?)
    mods = captured_arguments.smods,
  }
end

--- Handler for a user command. Mediates to the actual command.
--- (see `:help nvim_create_user_command()`)
---
--- @param package_name string
--- @return function command_handler
local function create_handler_for_placeholder_command(package_name)
  return function(captured_arguments)
    vim.api.nvim_command('packadd ' .. package_name)

    local command = parse_captured_arguments_as_command(captured_arguments)
    vim.api.nvim_cmd(command, {})
  end
end

--- Callback for user command completion. Mediates to the actual command.
--- (see `:help nvim_create_user_command()`)
---
--- @param package_name string
--- @param command_name string
--- @return function handler
local function create_callback_for_command_completion(package_name, command_name)
  return function()
    vim.api.nvim_command('packadd ' .. package_name)
    return vim.fn.getcompletion(command_name .. ' ', 'cmdline') -- Without the trailing space, completion does not trigger properly.
  end
end

--- Mechanism to postpone the loading of an optional package ("plugin") by the
--- trigger of a command. Also known as lazy loading. (see `:help packages`)
---
--- This creates a placeholder command for each given command of the package. On
--- first call it loads the package that actually defines the command(s) and
--- dispatches the command call again.
--- A similar mechanism is triggered when any placeholder command is used
--- directly in the command-line and autocompletion is triggered.
---
--- Note:
--- It is expected that packages "force" overwrite all of its commands. That
--- means they do no set the `unique` option.
---
--- @param package_name string
--- @param command_name_s string | string[] command name(s) - one or more
local function load_package_on_command_s(package_name, command_name_s)
  local command_names = type(command_name_s) == 'string' and { command_name_s }
    or type(command_name_s) == 'table' and command_name_s
    or {}

  for _, command_name in ipairs(command_names) do
    vim.api.nvim_create_user_command(
      command_name,
      create_handler_for_placeholder_command(package_name),
      {
        nargs = '*',
        bang = true,
        range = true,
        complete = create_callback_for_command_completion(package_name, command_name),
        desc = string.format(
          'Lazy loading listener to load real %s command. The actual command description will be available on first usage.',
          command_name
        ),
      }
    )
  end
end

return {
  load_package_on_command_s = load_package_on_command_s,
}
