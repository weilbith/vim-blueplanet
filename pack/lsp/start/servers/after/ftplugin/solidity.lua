local build_start_options = require('custom.lsp').build_start_options

vim.lsp.start(build_start_options(vim.bo[0].ft, {
  name = 'SolC Language Server',
  cmd = { 'solc', '--lsp' },
}))
