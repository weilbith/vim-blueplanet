vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      documentLink = {
        dynamicRegistration = true,
        tooltipSupport = true,
      },
      typeHierarchy = {
        dynamicRegistration = false,
      },
      onTypeFormatting = {
        dynamicRegistration = false,
      },
    },
  },
})
