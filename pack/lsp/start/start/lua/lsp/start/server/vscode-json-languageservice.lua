return function()
  require("lsp.start")({
    name = 'VSCode JSON Language-Service',
    cmd = { 'vscode-json-language-server', '--stdio' },
    root_dir = require("lsp.start.utilities").find_root({ '.git' }),
    init_options = {
      provideFormatter = true,
    },
  })
end
