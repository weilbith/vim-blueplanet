local configuration = require('custom.lsp.configuration')

configuration.add_configuration(configuration.ConfigurationKind.capabilities, {
  textDocument = {
    documentLink = {
      dynamicRegistration = true,
      tooltipSupport = true,
    },
    typeHierarchy = {
      dynamicRegistration = false,
    },
    linkedEditingRange = {
      dynamicRegistration = false,
    },
    onTypeFormatting = {
      dynamicRegistration = false,
    },
  },
})
