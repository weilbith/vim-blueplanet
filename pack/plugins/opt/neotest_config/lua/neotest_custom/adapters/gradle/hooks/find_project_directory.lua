local lib = require('neotest.lib')
local project_root_files = require('neotest_custom.adapters.gradle.constants').project_root_files

return lib.files.match_root_pattern(project_root_files[1], project_root_files[2])
