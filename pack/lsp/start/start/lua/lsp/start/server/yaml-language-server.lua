return function()
  require("lsp.start")({
    name = 'YAML Language Server',
    cmd = { 'yaml-language-server', '--stdio' },
    root_dir = require("lsp.start.utilities").find_root({ '.git' }),
    settings = {
      redhat = {
        telemetry = {
          enabled = false,
        },
      },
    },
  })
end
