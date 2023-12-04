local lib = require('neotest.lib')
local find_project_directory = require(
  'neotest_custom.adapters.gradle.hooks.find_project_directory'
)

--- @param project_directory string
local function get_gradle_executable(project_directory)
  local gradle_wrapper_folder = lib.files.match_root_pattern('gradlew')(project_directory)
  local gradle_wrapper_found = gradle_wrapper_folder ~= nil

  if gradle_wrapper_found then
    return gradle_wrapper_folder .. lib.files.sep .. 'gradlew'
  else
    return 'gradle'
  end
end

--- @param gradle_executable string
--- @param project_directory string
local function get_test_results_directory(gradle_executable, project_directory)
  local command = {
    gradle_executable,
    '--project-dir',
    project_directory,
    'properties',
    '--property',
    'testResultsDir',
  }
  local _, output = lib.process.run(command, { stdout = true })
  local output_lines = vim.split(output.stdout or '', '\n')

  for _, line in pairs(output_lines) do
    if line:match('testResultsDir: ') then
      return line:gsub('testResultsDir: ', '') .. lib.files.sep .. 'test'
    end
  end
end

local function get_namespaces_of_tree(tree)
  local namespaces = {}

  for _, position in tree:iter() do
    if position.type == 'namespace' then
      table.insert(namespaces, position)
    end
  end

  return namespaces
end

local function get_test_filter_arguments(tree, position)
  local arguments = {}

  if position.type == 'test' or position.type == 'namespace' then
    vim.list_extend(arguments, { '--tests', "'" .. position.id .. "'" })
  elseif position.type == 'file' then
    local namespaces = get_namespaces_of_tree(tree)

    for _, namespace in pairs(namespaces) do
      vim.list_extend(arguments, { '--tests', "'" .. namespace.id .. "'" })
    end
  end

  return arguments
end

return function(arguments)
  local position = arguments.tree:data()
  local project_directory = find_project_directory(position.path)
  local gradle_executable = get_gradle_executable(project_directory)
  local command = { gradle_executable, '--project-dir', project_directory, 'test' }
  vim.list_extend(command, get_test_filter_arguments(arguments.tree, position))

  local context = {}
  context.test_resuls_directory = get_test_results_directory(gradle_executable, project_directory)

  return { command = table.concat(command, ' '), context = context }
end
