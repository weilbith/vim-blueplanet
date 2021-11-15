local lsp_config = require('lspconfig')

lsp_config.cmake.setup({})
lsp_config.flow.setup({})
lsp_config.dockerls.setup({})
lsp_config.pylsp.setup({})
lsp_config.texlab.setup({})
lsp_config.tsserver.setup({})
lsp_config.vimls.setup({})
lsp_config.vuels.setup({})
lsp_config.solargraph.setup({})
lsp_config.rnix.setup({})
lsp_config.yamlls.setup({})

lsp_config.html.setup({
  cmd = { 'vscode-html-languageserver', '--stdio' },
})

lsp_config.jsonls.setup({
  cmd = { 'vscode-json-languageserver', '--stdio' },
})

lsp_config.terraformls.setup({
  cmd = { 'terraform-lsp', 'serve' },
})

lsp_config.bashls.setup({
  filetypes = { 'sh', 'zsh' },
})

lsp_config.cssls.setup({
  filetypes = { "css", "scss", "sass", "less" },
  cmd = { 'vscode-html-languageserver', '--stdio' },
})

lsp_config.rust_analyzer.setup({
  capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits" },
            }
          }
        },
      },
      experimental = {
        hoverActions = true,
        hoverRange = true,
        serverStatusNotification = true,
        snippetTextEdit = true,
        codeActionGroup = true,
        commands = {
          "rust-analyzer.runSingle",
          "rust-analyzer.debugSingle",
          "rust-analyzer.showReferences",
          "rust-analyzer.gotoLocation",
          "editor.action.triggerParameterHints",
        },
      },
    }
  ),
	settings = {
	  ["rust-analyzer"] = {
	    completion = {
			  autoimport = { enable = true},
			},
		},
	},
})

lsp_config.efm.setup({
  filetypes = { "sh", "json"},
  init_options = {
    documentFormatting = true,
    hover = false,
    documentSymbol = false,
    codeAction = false,
    completion = false,
  },
  settings = {
    rootMarkers = { "package.json", "pyproject.toml", "Cargo.toml", ".git/" },
    languages = {
      sh = {
        require('efm_config.linting').shellcheck,
        require('efm_config.formatting').shfmt,
      },
      json = {
        require('efm_config.linting').jsonlint,
      },
    },
  },
})

lsp_config.sumneko_lua.setup(
  require("lua-dev").setup({
    lspconfig = {
      cmd = { "lua-language-server" },
    }
  })
)

-- Note: Putting the setup calls into ftplugins saves 0.5ms per call during
-- startup. At the moment it is not worth to write that many sudpid ftplugins.
