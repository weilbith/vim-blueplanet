--- @type vim.lsp.Config
return {
  cmd = { 'gopls' },
  filetypes = { 'go' },
  root_markers = { { 'go.mod', 'go.work' } },
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
}
