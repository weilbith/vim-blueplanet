local lib = require('neotest.lib')
local filetype = require('plenary.filetype')
local position_queries = require('neotest_custom.adapters.gradle.position_queries')

return function(path)
  local file_type = filetype.detect(path)
  local position_query = position_queries[file_type]

  return lib.treesitter.parse_positions(path, position_query, {
    build_position = 'require("neotest_custom.adapters.gradle.hooks.build_position")',
    position_id = 'require("neotest_custom.adapters.gradle.hooks.build_position_identifier")',
  })
end
