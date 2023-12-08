local simplified_capabilities = vim.tbl_deep_extend(
  'force',
  vim.lsp.protocol.make_client_capabilities(),
  {
    textDocument = {
      colorProvider = {
        dynamicRegistration = true,
      },
      completion = {
        completionItem = {
          snippetSupport = true,
          preselectSupport = true,
          insertReplaceSupport = true,
          labelDetailsSupport = true,
          depractedSupport = true,
          commitCharactersSupport = true,
          resolveSupport = {
            properties = {
              'documentation',
              'details',
              'additionalTextEdits',
            },
          },
        },
      },
    },
  }
)

local base_capabilities = vim.tbl_deep_extend('force', simplified_capabilities, {
  completion = {
    completionItem = {
      tagSupport = true,
    },
  },
})

local base_configuration = {
  capabilities = base_capabilities,
}

local lsp_config = require('lspconfig')

lsp_config.texlab.setup(base_configuration)
lsp_config.lemminx.setup(base_configuration)
lsp_config.tailwindcss.setup(base_configuration)
lsp_config.eslint.setup(base_configuration)
lsp_config.solargraph.setup(base_configuration)
lsp_config.rnix.setup(base_configuration)
lsp_config.yamlls.setup({
  capabilities = base_capabilities,
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

lsp_config.solidity_ls.setup(base_configuration)
lsp_config.gradle_ls.setup({})
lsp_config.kotlin_language_server.setup({
  capabilities = simplified_capabilities,
  settings = {
    externalSources = {
      autoConvertToKotlin = true,
    },
  },
})

lsp_config.jdtls.setup({
  capabilities = simplified_capabilities,
  settings = {
    java = {
      completion = {
        guessMethodArguments = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = 'all',
        },
      },
      signatureHelp = {
        description = {
          enabled = true,
        },
      },
      referencesCodeLens = {
        enabled = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
    },
  },
})
lsp_config.html.setup({
  capabilities = base_capabilities,
  cmd = { 'vscode-html-languageserver', '--stdio' },
})

lsp_config.jsonls.setup({
  capabilities = base_capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
  cmd = { 'vscode-json-languageserver', '--stdio' },
})

lsp_config.terraformls.setup({
  capabilities = base_capabilities,
  cmd = { 'terraform-lsp', 'serve' },
})

lsp_config.bashls.setup({
  capabilities = base_capabilities,
  filetypes = { 'sh', 'zsh' },
})

lsp_config.cssls.setup({
  capabilities = base_capabilities,
  filetypes = { 'css', 'scss', 'sass', 'less' },
  cmd = { 'vscode-html-languageserver', '--stdio' },
})

-- Note: Putting the setup calls into ftplggins saves 0.5ms per call during
-- startup. At the moment it is not worth to write that many sudpid ftplugins.
