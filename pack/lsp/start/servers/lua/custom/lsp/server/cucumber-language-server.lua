local start_server = require('custom.lsp').start_server
local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

-- start_server(build_start_options({
--   name = 'Cucumber Language Server',
--   cmd = { 'cucumber-language-server', '--stdio' },
--   root = find_root({ '.git' }),
-- }))
