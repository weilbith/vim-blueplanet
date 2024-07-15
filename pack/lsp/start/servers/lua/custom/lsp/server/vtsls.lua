local start_server = require('custom.lsp').start_server
local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

-- TODO: Check with Vue take-over mode
start_server(build_start_options({
  name = 'VSCode TypeScript Wrapper',
  cmd = { 'vtsls', '--stdio' },
  root_dir = find_root({ 'tsconfig.json' }),
  capabilities = {
    workspace = {
      fileOperations = {
        willCreate = true,
        willRename = true,
        willDelete = true,
      },
    },
  },
  -- https://github.com/yioneko/vtsls/blob/main/packages/service/configuration.schema.json
  settings = {
    typescript = {
      referencesCodeLens = {
        enabled = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = {
        parameterNames = { enabled = 'all' },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
      },
      format = { enable = false }, -- TODO: check if helpful
      preferences = {
        preferTypeOnlyAutoImports = true,
        renameShorthandProperties = false,
        useAliasesForRenames = false,
      },
      updateImportsOnFileMove = {
        enabled = 'always',
      },
      preferGoToSourceDefinition = true,
    },
    vtsls = {
      experimental = {
        completion = { enableServerSideFuzzyMatch = true },
      },
    },
  },
}))
