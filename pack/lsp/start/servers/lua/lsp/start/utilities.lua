--- @param file_or_directory_names table[string] - list of file names or directories to search for
local function find_root(file_or_directory_names)
  local matches = vim.fs.find(file_or_directory_names, {
    upward = true,
    stop = vim.uv.os_homedir(),
    path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
  })

  if matches ~= nil then
    return vim.fs.dirname(matches[1])
  else
    return ''
  end
end

-- TODO: Add caching
--
--- @param dependency_name string
--- @param on_has_dependency function
--- @param on_has_not_dependency function
local function check_npm_dependency(dependency_name, on_has_dependency, on_has_not_dependency)
  local command = { 'npm', 'list', '--package-lock-only', '--depth=0', dependency_name }

  local on_exit = function(response)
    local has_dependency = string.find(response.stdout, 'empty') == nil
    return has_dependency and on_has_dependency() or on_has_not_dependency()
  end

  vim.system(command, {}, on_exit)
end

return {
  find_root = find_root,
  check_npm_dependency = check_npm_dependency,
}
