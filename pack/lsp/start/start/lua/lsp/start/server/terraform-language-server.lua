return function()
  require("lsp.start")({
    name = 'Terraform Language Server',
    cmd = { 'terraform-ls', 'serve' },
    root_dir = require("lsp.start.utilities").find_root({ '.terraform' }),
  })
end
