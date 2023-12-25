local configuration = require('custom.lsp.configuration')

configuration.add_configuration(configuration.ConfigurationKind.capabilities, {
  textDocument = {
    colorProvider = {
      dynamicRegistration = true,
    },
  },
})
