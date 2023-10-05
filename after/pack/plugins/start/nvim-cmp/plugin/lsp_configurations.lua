local configuration = require('custom.lsp.configuration')

configuration.add_configuration(
  configuration.ConfigurationKind.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)
