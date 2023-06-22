local get_package_name = require('neotest_custom.adapters.gradle.shared_utilities').get_package_name

--- @param name string
local function get_clean_position_name(name)
  return (name:gsub('`', ''))
end

--- @param namespaces table
local function get_namespace_name(namespaces)
  local namespace_names = vim.tbl_map(function(namespace)
    return namespace.handle_name
  end, namespaces)

  local full_namespace = table.concat(namespace_names, '.')
  return #full_namespace > 0 and (full_namespace .. '.') or ''
end

return function(position, namespaces)
  local package_name = get_package_name(position.path)
  local namespace_name = get_namespace_name(namespaces)
  local position_name = get_clean_position_name(position.handle_name)
  return package_name .. '.' .. namespace_name .. position_name
end
