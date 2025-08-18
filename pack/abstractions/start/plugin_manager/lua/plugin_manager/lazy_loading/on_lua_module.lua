--- Predicate if given string value starts with a prefix.
---
---@param value string to evaluate
---@param prefix string to check for
---@return boolean
local function starts_with(value, prefix)
  return string.sub(value, 1, #prefix) == prefix
end

--- This creates a searcher function to be inserted into the `package.loaders`
--- table for Lua. The function will only return a module loader, when a matching
--- module is searched for. In that case, also the related NeoVim plugin will
--- be added too. In the other case, nothing happens.
---
--- The "root" module name is used, to this search function will match also
--- submodules. For example "foo" will also match a search for "foo.bar.baz".
---
--- @param plugin_name string
--- @param root_module_name string
--- @return function module_loader
local function create_searcher_function_for_module(plugin_name, root_module_name)
  return function(module_name)
    local is_matching_module = starts_with(module_name, root_module_name)

    if is_matching_module then
      vim.cmd.packadd(plugin_name)

      -- There can be the case that the added plugin has loaded this
      -- module in the meantime. In that case, avoid compiling it again.
      --
      -- This especially the case with plugins that configure other plugins,
      -- having same name as the plugin defining the Lua module. Having such
      -- a plugin, calling the Lua API of the actual plugin causes nested
      -- `require()` calls (e.g. calling the `setup` function of a plugin).

      local module = package.loaded[module_name]
      local is_already_loaded = module ~= nil

      if is_already_loaded then
        return function()
          return module
        end
      else
        return vim._load_package(module_name)
      end
    end
  end
end

--- Mechanism to postpone the loading of a plugin in an optional package by the
--- trigger of a required Lua module. (see `:help package`)
---
--- The root module name is used, to this will also matching require calls to
--- submodules. For example "foo" will also match when `require("foo.bar.baz")`
--- is called.
---
--- @param plugin_name string
--- @param root_module_name string
--- @return nil
local function lazy_load_plugin_on_lua_module(plugin_name, root_module_name)
  local searcher_function = create_searcher_function_for_module(plugin_name, root_module_name)
  local index_of_new_loader = #package.loaders - 1 -- Insert before default error handler function.
  table.insert(package.loaders, index_of_new_loader, searcher_function)
  -- TODO: How to remove enty after module is loaded? Issue with list indicies.
end

return lazy_load_plugin_on_lua_module
