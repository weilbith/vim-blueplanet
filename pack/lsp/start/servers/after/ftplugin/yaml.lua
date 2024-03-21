local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

vim.lsp.start(build_start_options(vim.bo[0].ft, {
  name = 'RedHat YAML Language Server',
  cmd = { 'yaml-language-server', '--stdio' },
  root_dir = find_root({ '.git' }),
  settings = {
    redhat = {
      telemetry = {
        enabled = false,
      },
    },
  },
}))
