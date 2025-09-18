--- Mechanism to postpone the loading of a plugin in an optional package by the
--- trigger of an event. Also known as lazy loading.
--- (see `:help packages`)
---
--- This is quite trivial logic, but saves some annoying boilerplate code
--- everywhere. Under the hood it simply defines a one-shot auto-command to load
--- the plugin.
---
--- @param plugin_name string
--- @param event_name_s vim.api.keyset.events | vim.api.keyset.events[] see `:help autocmd-events`
--- @param pattern? string | string[] see `:help autocmd-pattern`
local function lazy_load_plugin_on_event_s(plugin_name, event_name_s, pattern)
  local group_name = 'lazy-load-plugin_' .. plugin_name
  local group = vim.api.nvim_create_augroup(group_name, {})

  vim.api.nvim_create_autocmd(event_name_s, {
    group = group,
    once = true,
    pattern = pattern,
    callback = function()
      vim.cmd.packadd(plugin_name)
    end,
  })
end

return lazy_load_plugin_on_event_s
