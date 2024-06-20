local start_server = require('custom.lsp').start_server
local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

start_server(build_start_options({
  name = 'Go Language Server',
  cmd = { 'gopls' },
  root_dir = find_root({ 'go.mod', 'go.work' }),
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        functionTypeParameters = true,
        parameterNames = true,
      },
      semanticTokens = true,
      usePlaceholders = true,
    },
  },
}))
