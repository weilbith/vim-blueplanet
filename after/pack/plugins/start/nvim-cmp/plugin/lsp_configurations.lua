local configuration = require('lsp.start.configuration')

configuration.add_configuration(
  configuration.ConfigurationKind.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
