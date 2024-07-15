local start_server = require('custom.lsp').start_server
local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

start_server(build_start_options({
  name = 'Vue Language Tools',
  cmd = { 'vue-language-server', '--stdio' },
  root_dir = find_root({ 'package.json' }),
  init_options = {
    typescript = {
      tsdk = find_root({ 'node_modules' }) .. '/node_modules/typescript/lib',
    },
  },
}))
