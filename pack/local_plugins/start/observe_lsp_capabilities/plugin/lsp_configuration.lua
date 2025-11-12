vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      typeHierarchy = {
        dynamicRegistration = false,
      },
      onTypeFormatting = {
        dynamicRegistration = false,
      },
    },
  },
})
