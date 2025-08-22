-- TODO: Check with Vue take-over mode
return function()
  require('lsp.start')({
    name = 'VSCode TypeScript Wrapper',
    cmd = { 'vtsls', '--stdio' },
    root_dir = vim.fs.root(0, 'tsconfig.json'),
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
        -- format = { enable = false },
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
  })
end
