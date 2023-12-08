local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

vim.lsp.start(vim.tbl_deep_extend('force', build_start_options('dockerfile'), {
  name = 'Dockerfile Language Server',
  cmd = { 'docker-langserver', '--stdio' },
  root_dir = find_root({ 'Dockerfile' }),
}))
