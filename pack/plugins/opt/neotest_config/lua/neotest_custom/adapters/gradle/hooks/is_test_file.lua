local test_file_patterns = require('neotest_custom.adapters.gradle.constants').test_file_patterns

--- @param file_path string
return function(file_path)
  for _, pattern in pairs(test_file_patterns) do
    if file_path:match(pattern) then
      return true
    end
  end

  return false
end
