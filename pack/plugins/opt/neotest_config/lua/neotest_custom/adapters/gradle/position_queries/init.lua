local kotlin_queries = require('neotest_custom.adapters.gradle.position_queries.kotlin')
local java_queries = require('neotest_custom.adapters.gradle.position_queries.java')

return {
  kotlin = kotlin_queries,
  java = java_queries,
}
