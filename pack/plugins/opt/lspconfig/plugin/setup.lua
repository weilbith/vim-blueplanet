local base_capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
          preselectSupport = true,
          insertReplaceSupport = true,
          labelDetailsSupport = true,
          depractedSupport = true,
          commitCharactersSupport = true,
          tagSupport = true,
          resolveSupport = {
            properties = {
              'documentation', 'details', 'additionalTextEdits'
            },
          }
        }
      }
    }
  }
)

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
  settings ={
    pyls = {
      plugins = {
        pycodestyle = {
          enabled = false,
        },
        pyls_mypy = {
          enabled = true,
        }
      },
    },
  },
})
lsp_config.texlab.setup(base_configuration)
lsp_config.vimls.setup(base_configuration)
lsp_config.vuels.setup(base_configuration)
lsp_config.solargraph.setup(base_configuration)
lsp_config.rnix.setup(base_configuration)
lsp_config.yamlls.setup(base_configuration)
lsp_config.solidity_ls.setup(base_configuration)
lsp_config.sumneko_lua.setup({
  capabilities = base_capabilities,
  settings = {
    Lua = {
      workspace = {
        library = { "/home/thore/projects/nvim-outline/lua_modules/lib/luarocks/rocks-5.4/busted/2.0.0-1" },
      },
      runtime = {
        path = { "?.lua", "?/init.lua" }
      }
    },
  },
})

lsp_config.tsserver.setup({
  capabilities = base_capabilities,
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
})

lsp_config.html.setup({
  capabilities = base_capabilities,
  cmd = { 'vscode-html-languageserver', '--stdio' },
})

lsp_config.jsonls.setup({
  capabilities = base_capabilities,
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
  filetypes = { "css", "scss", "sass", "less" },
  cmd = { 'vscode-html-languageserver', '--stdio' },
})

lsp_config.rust_analyzer.setup({
  capabilities = vim.tbl_deep_extend(
    "force",
    base_capabilities,
    {
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

-- Note: Putting the setup calls into ftplggins saves 0.5ms per call during
-- startup. At the moment it is not worth to write that many sudpid ftplugins.
