local function is_module_not_found_error(error)
  return error:match("module '.*' not found") and true or false
end

---@class SnippetLibrary
---@field kind 'autosnippets' | 'snippets'
local SnippetLibrary = {}

---@param kind 'autosnippets' | 'snippets'
function SnippetLibrary:new(kind)
  local instance = { kind = kind }
  setmetatable(instance, self)
  return instance
end

function SnippetLibrary:__index(language)
  local module_path = 'snippets.filetypes.' .. language
  local ok, snippets_or_error = pcall(require, module_path)

  if not ok and not is_module_not_found_error(snippets_or_error) then
    error(snippets_or_error, 1)
  end

  local snippets = ok and snippets_or_error or {}
  return snippets[self.kind] or {}
end

function SnippetLibrary.reload()
  for package_name, _ in pairs(package.loaded) do
    if package_name:find('^snippets%..+') then
      package.loaded[package_name] = nil
    end
  end
end

return SnippetLibrary
