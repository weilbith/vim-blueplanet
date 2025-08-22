return function()
  require('lsp.start')({
    name = 'YAML Language Server',
    cmd = { 'yaml-language-server', '--stdio' },
    root_dir = vim.fs.root(0, '.git'),
    settings = {
      redhat = {
        telemetry = {
          enabled = false,
        },
      },
    },
  })
end
