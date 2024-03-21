local configuration = require('custom.lsp.configuration')

configuration.add_configuration(configuration.ConfigurationKind.settings, {
  json = {
    schemas = require('schemastore').json.schemas(),
    validate = { enable = true },
  },
}, 'json')

configuration.add_configuration(configuration.ConfigurationKind.settings, {
  yaml = {
    schemastore = {
      enable = false,
      url = '',
    },
    schemas = require('schemastore').yaml.schemas(),
  },
}, 'yaml')
