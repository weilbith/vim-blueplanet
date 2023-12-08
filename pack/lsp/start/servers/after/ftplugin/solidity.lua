local build_start_options = require('custom.lsp').build_start_options

vim.lsp.start(vim.tbl_deep_extend('force', build_start_options('solidity'), {
  name = 'SolC Language Server',
  cmd = { 'solc', '--lsp' },
}))
