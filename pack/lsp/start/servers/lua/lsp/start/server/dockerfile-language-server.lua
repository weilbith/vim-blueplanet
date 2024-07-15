require("lsp.start")({
  name = 'Dockerfile Language Server',
  cmd = { 'docker-langserver', '--stdio' },
  root_dir = require("lsp.start.utilities").find_root({ 'Dockerfile' }),
})
