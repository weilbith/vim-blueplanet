local configuration = require('lsp.start.configuration')

configuration.add_configuration(
  configuration.ConfigurationKind.before_init,
  require('neodev.lsp').before_init,
  'lua'
)
