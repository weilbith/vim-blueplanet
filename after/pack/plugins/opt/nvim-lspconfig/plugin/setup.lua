-- **NOTE:**
--
-- Most of the servers are started manually now within the `lsp server` package.
-- This are just some remaining servers I haven't configured yet myself. The new
-- approach also makes use of the new middleware and global configuration
-- approach.

local simplified_capabilities = vim.tbl_deep_extend(
  'force',
  vim.lsp.protocol.make_client_capabilities(),
  {
    textDocument = {
      colorProvider = {
        dynamicRegistration = true,
      },
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
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
      -- Observe Features
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
lsp_config.eslint.setup(base_configuration)
lsp_config.rnix.setup(base_configuration)
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
})

lsp_config.cssls.setup({
  capabilities = base_capabilities,
  filetypes = { 'css', 'scss', 'sass', 'less' },
  cmd = { 'vscode-html-languageserver', '--stdio' },
})

-- Note: Putting the setup calls into ftplggins saves 0.5ms per call during
-- startup. At the moment it is not worth to write that many sudpid ftplugins.
