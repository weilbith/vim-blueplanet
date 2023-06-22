return {
  name = 'gradle-test',
  root = require('neotest_custom.adapters.gradle.hooks.find_project_directory'),
  is_test_file = require('neotest_custom.adapters.gradle.hooks.is_test_file'),
  discover_positions = require('neotest_custom.adapters.gradle.hooks.discover_positions'),
  build_spec = require('neotest_custom.adapters.gradle.hooks.build_run_specification'),
  results = require('neotest_custom.adapters.gradle.hooks.collect_results'),
}
