local start_server = require('custom.lsp').start_server
local build_start_options = require('custom.lsp').build_start_options

start_server(build_start_options({
  name = 'Typst LSP',
  cmd = { 'typst-lsp' },
}))
