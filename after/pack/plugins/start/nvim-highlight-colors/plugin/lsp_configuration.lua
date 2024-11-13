local configuration = require('lsp.start.configuration')

configuration.add_configuration(configuration.ConfigurationKind.capabilities, {
  textDocument = {
    colorProvider = {
      dynamicRegistration = true,
    },
  },
})