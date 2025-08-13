--- Mechanism to postpone the loading of an optional package ("plugin") by the
--- trigger of an event. Also known as lazy loading. (see `:help packages`)
---
--- This is quite trivial logic, but saves some annoying boilerplate code
--- everywhere. Under the hood it simply defines a one-shot auto-command to load
--- the package.
---
--- @param package_name string
--- @param event_name_s string | string[] see `:help autocmd-events`
--- @param pattern? string | string[] see `:help autocmd-pattern`
local function load_package_on_event_s(package_name, event_name_s, pattern)
  local group_name = 'load-' .. package_name
  local group = vim.api.nvim_create_augroup(group_name, {})

  vim.api.nvim_create_autocmd(event_name_s, {
    group = group,
    once = true,
    pattern = pattern,
    callback = function()
      vim.cmd.packadd(package_name)
    end,
  })
end

return {
  load_package_on_event_s = load_package_on_event_s,
}
