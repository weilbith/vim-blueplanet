local configuration = require('lsp.start.configuration')

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

vim.lsp.config('vscode-json-language-server', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

vim.lsp.config('yaml-language-server', {
  settings = {
    yaml = {
      schemastore = {
        enable = false,
        url = '',
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
})
