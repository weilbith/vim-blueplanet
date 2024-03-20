local configuration = require('custom.lsp.configuration')

configuration.add_configuration(
  configuration.ConfigurationKind.before_init,
  require('neodev.lsp').before_init,
  'lua'
)
