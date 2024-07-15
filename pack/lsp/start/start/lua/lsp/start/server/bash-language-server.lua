require("lsp.start")({
  name = 'Bash Language Server',
  cmd = { 'bash-language-server', 'start' },
  root_dir = require("lsp.start.utilities").find_root({ '.git' }),
})
