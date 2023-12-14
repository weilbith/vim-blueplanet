local configuration = require('custom.lsp.configuration')

configuration.add_configuration(configuration.ConfigurationKind.capabilities, {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
})
