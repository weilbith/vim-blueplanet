local start_server = require('custom.lsp').start_server
local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

start_server(build_start_options({
  name = 'Python LSP Server',
  cmd = { 'pylsp' },
  root_dir = find_root({
    'pyproject.toml',
    'setup.py',
  }),
  settings = {
    pyls = {
      plugins = {
        pycodestyle = {
          enabled = false,
        },
        pyls_mypy = {
          enabled = true,
        },
      },
    },
  },
}))
