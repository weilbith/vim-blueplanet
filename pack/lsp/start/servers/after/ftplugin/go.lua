local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

vim.lsp.start(vim.tbl_deep_extend('force', build_start_options('go'), {
  name = 'Go Language Server',
  cmd = { 'gopls' },
  root_dir = find_root({ 'go.mod', 'go.work' }),
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        functionTypeParameters = true,
        parameterNames = true,
      },
      semanticTokens = true,
      usePlaceholders = true,
    },
  },
}))
