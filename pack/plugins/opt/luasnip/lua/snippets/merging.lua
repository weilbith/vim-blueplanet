local function extend_table(a, b)
  for _, entry in pairs(b) do
    table.insert(a, entry)
  end
end

local function merge_submodules_with_snippets(base_path, all_module_names)
  local snippets = {}
  local autosnippets = {}

  for _, module_name in pairs(all_module_names) do
    local module = require(base_path .. '.' .. module_name)
    extend_table(snippets, module.snippets or {})
    extend_table(autosnippets, module.autosnippets or {})
  end

  return {
    autosnippets = autosnippets,
    snippets = snippets,
  }
end

return {
  merge_submodules_with_snippets = merge_submodules_with_snippets,
}
