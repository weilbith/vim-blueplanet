return function()
  require("lsp.start")({
    name = 'Go Language Server',
    cmd = { 'gopls' },
    root_dir = require("lsp.start.utilities").find_root({ 'go.mod', 'go.work' }),
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
