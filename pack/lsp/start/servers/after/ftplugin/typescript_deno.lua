local start_server = require('custom.lsp').start_server
local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

start_server(build_start_options({
  name = 'Deno Lanugage Server',
  cmd = { 'deno', 'lsp' },
  root_dir = find_root({ 'deno.json', 'deno.jsonc', 'deno.lock' }),
  settings = {
    deno = {
      enable = true,
    },
  },
}))
