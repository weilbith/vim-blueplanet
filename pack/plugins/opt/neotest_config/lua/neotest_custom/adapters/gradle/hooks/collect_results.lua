local lib = require('neotest.lib')
local xml = require('neotest.lib.xml')
local get_package_name = require('neotest_custom.adapters.gradle.shared_utilities').get_package_name

--- @param directory_path string
local function read_junit_result_xmls_from_directory(directory_path)
  local junit_files = lib.files.find(directory_path, {
    filter_dir = function(name)
      return name ~= 'binary'
    end,
  })

  return vim.tbl_map(function(file_path)
    local content = lib.files.read(file_path)
    return xml.parse(content)
  end, junit_files)
end

--- @param xml_node table
local function get_xml_node_as_list(xml_node)
  return #xml_node > 0 and xml_node or { xml_node }
end

--- @param failure_xml table
--- @param position table
local function parse_error_from_failure_xml(failure_xml, position)
  local type = failure_xml._attr.type
  local message = (failure_xml._attr.message:gsub(type .. '.*\n', ''))
  local stack_trace = failure_xml[1] or ''
  local package_name = get_package_name(position.path)
  local line_number

  for _, line in ipairs(vim.split(stack_trace, '[\r]?\n')) do
    local pattern = '^.*at.+' .. package_name .. '.*%(.+..+:(%d+)%)$'
    local match = line:match(pattern)

    if match then
      line_number = tonumber(match) - 1
      break
    end
  end

  return { message = message, line = line_number }
end

local function find_position_for_test_case(tree, test_case)
  local name = test_case._attr.name:gsub('%(%)', '')
  local package_and_class = (test_case._attr.classname:gsub('%$', '%.'))

  for _, position in tree:iter() do
    if position.name == name and vim.startswith(position.id, package_and_class) then
      return position
    end
  end
end

return function(build_specfication, _, tree)
  local results = {}
  local position = tree:data()
  local parsed_xmls = read_junit_result_xmls_from_directory(
    build_specfication.context.test_resuls_directory
  )

  for _, parsed_xml in pairs(parsed_xmls) do
    for _, suite in pairs(get_xml_node_as_list(parsed_xml.testsuite)) do
      for _, case in pairs(get_xml_node_as_list(suite.testcase)) do
        local match_position = find_position_for_test_case(tree, case)

        if match_position ~= nil then
          local status = case.failure and 'failed' or 'passed'
          local short = (case.failure or {}).message
          local errors = case.failure and { parse_error_from_failure_xml(case.failure, position) }
          local result = { status = status, short = short, errors = errors }
          results[match_position.id] = result
        end

        -- TODO: What to do here?
      end
    end
  end

  return results
end
