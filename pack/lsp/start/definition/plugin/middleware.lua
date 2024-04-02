local add_middleware = require('custom.lsp.middleware').add_middleware

--- @param location table<string, any> - Location object according to LSP
--- @return boolean
local function location_points_to_react_type_definitions(location)
  return vim.endswith(location.targetUri, 'react/index.d.ts')
end

--- @param result table? - according to LSP response object
local function result_matches_scenario_of_react_component_definition_result(result)
  result = result or {}

  local has_scenario_specific_number_of_entries = #result == 2
  local any_entry_points_to_react_type_definition = vim.tbl_contains(
    result,
    location_points_to_react_type_definitions,
    { predicate = true }
  )

  return has_scenario_specific_number_of_entries and any_entry_points_to_react_type_definition
end

--- When trying to get the definition of a React component used in a JSX
--- template, the language server does not respond precisely. Instead it
--- returns a list of two definitions. One of them points to the React type
--- definition of a ReadNode in the dependencies.
--- This is very annoying. Identifying this scenario and filtering that
--- unwanted second response entry helps to jump (preview, ...) directly to
--- the intended location.
---
--- @param result table - according to LSP response object
--- @return table result but potentially filtered
local function filter_results_to_react_node_type(result)
  if result_matches_scenario_of_react_component_definition_result(result) then
    return vim.tbl_filter(function(location)
      return not location_points_to_react_type_definitions(location)
    end, result)
  else
    return result
  end
end

add_middleware('textDocument/definition', function(error, result, context, configuration)
  result = filter_results_to_react_node_type(result)
  return true, error, result, context, configuration
end, 100, 'typescriptreact')
