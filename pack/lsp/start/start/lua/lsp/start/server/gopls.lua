return function()
  require('lsp.start')({
    name = 'Go Language Server',
    cmd = { 'gopls' },
    root_dir = vim.fs.root(0, { { 'go.mod', 'go.work' } }),
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
  })
end
