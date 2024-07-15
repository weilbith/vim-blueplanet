return function()
  require("lsp.start")({
    name = 'Deno Lanugage Server',
    cmd = { 'deno', 'lsp' },
    root_dir = require("lsp.start.utilities").find_root({ 'deno.json', 'deno.jsonc', 'deno.lock' }),
    settings = {
      deno = {
        enable = true,
      },
    },
  })
end
