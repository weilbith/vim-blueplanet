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

lsp_config.cmake.setup(base_configuration)
lsp_config.flow.setup(base_configuration)
lsp_config.dockerls.setup(base_configuration)
lsp_config.solc.setup(base_configuration)
lsp_config.pylsp.setup({
  capabilities = base_capabilities,
  cmd = { 'pyls' },
  settings = {
    pyls = {
      plugins = {
        pycodestyle = {
          enabled = false,
        },
        pyls_mypy = {
          enabled = true,
        },
      },
    },
  },
})
lsp_config.texlab.setup(base_configuration)
lsp_config.lemminx.setup(base_configuration)
lsp_config.vimls.setup(base_configuration)
lsp_config.volar.setup({
  capabilities = base_capabilities,
  on_attach = function(client)
    -- Avoid conflicts with NullLS formatting
    client.server_capabilities.documentFormattingProvider = false
  end,
})
lsp_config.tailwindcss.setup(base_configuration)
lsp_config.eslint.setup(base_configuration)
lsp_config.solargraph.setup(base_configuration)
lsp_config.rnix.setup(base_configuration)
lsp_config.yamlls.setup(base_configuration)
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

lsp_config.lua_ls.setup({
  capabilities = base_capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          -- Busted - why does it not pick it up from the library?
          'insulate',
          'describe',
          'it',
          'assert',
        },
      },
      runtime = {
        path = { '?.lua', '?/init.lua' },
      },
      format = {
        enable = false,
      },
      hint = {
        enable = true,
        arrayIndex = 'Disable',
        setType = true,
      },
      IntelliSense = {
        traceLocalSet = true,
        traceReturn = true,
        traceBeSetted = true,
        traceFieldInject = true,
      },
      completion = {
        callSnippet = 'Both',
        keywordSnippet = 'Both',
        showParams = false,
      },
    },
  },
})

lsp_config.tsserver.setup({
  capabilities = base_capabilities,
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
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

lsp_config.rust_analyzer.setup({
  capabilities = vim.tbl_deep_extend('force', base_capabilities, {
    experimental = {
      hoverActions = true,
      hoverRange = true,
      serverStatusNotification = true,
      snippetTextEdit = true,
      codeActionGroup = true,
      commands = {
        'rust-analyzer.runSingle',
        'rust-analyzer.debugSingle',
        'rust-analyzer.showReferences',
        'rust-analyzer.gotoLocation',
        'editor.action.triggerParameterHints',
      },
    },
  }),
  settings = {
    ['rust-analyzer'] = {
      completion = {
        autoimport = { enable = true },
      },
      inlayHints = {
        enable = true,
      },
      interpret = {
        tests = true,
      },
      lens = {
        references = {
          adt = { enable = true },
          enumVariant = { enable = true },
          method = { enable = true },
          trait = { enable = true },
          excludeImports = true,
        },
      },
      rustfmt = {
        rangeFormatting = { enable = true },
      },
      workspace = {
        symbol = {
          search = {
            kind = 'all_symbols',
            limit = 1000,
          },
        },
      },
    },
  },
})

-- Note: Putting the setup calls into ftplggins saves 0.5ms per call during
-- startup. At the moment it is not worth to write that many sudpid ftplugins.
