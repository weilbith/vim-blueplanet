lua require('lspconfig').cmake.setup({})
lua require('lspconfig').bashls.setup({filetypes = {"sh", "zsh"}})
lua require('lspconfig').cssls.setup({ filetypes = { "css", "scss", "sass", "less" }})
lua require('lspconfig').dockerls.setup({})
lua require('lspconfig').html.setup({})
lua require('lspconfig').jsonls.setup({ cmd = { 'json-languageserver', '--stdio' }})
lua require('lspconfig').pylsp.setup({})
lua require('lspconfig').terraformls.setup({ cmd = { 'terraform-lsp', 'serve' }})
lua require('lspconfig').texlab.setup({})
lua require('lspconfig').tsserver.setup({})
lua require('lspconfig').vimls.setup({})
lua require('lspconfig').vuels.setup({})
lua require('lspconfig').solargraph.setup({})
lua require('lspconfig').rnix.setup({})
" lua require('lspconfig').yamlls.setup({})

lua require('lspconfig').rust_analyzer.setup({
      \   capabilities = require("lsp_capabilities").construct_custom_capabilities({
      \     snippetSupport = true,
      \   }),
			\   settings = {
			\			["rust-analyzer"] = {
			\				completion = {
			\					autoimport = { enable = true},
			\				},
			\     },
			\		},
      \ })

lua require('lspconfig').efm.setup({
      \   filetypes = { "sh", "json"},
      \   init_options = {
      \     documentFormatting = true,
      \     hover = false,
      \     documentSymbol = false,
      \     codeAction = false,
      \     completion = false,
      \   },
      \   settings = {
      \     rootMarkers = { "package.json", "pyproject.toml", "Cargo.toml", ".git/" },
      \     languages = {
      \       sh = {
      \         require('efm_config.linting').shellcheck,
      \         require('efm_config.formatting').shfmt,
      \	    },
      \       json = {
      \         require('efm_config.linting').jsonlint,
      \       },
      \     },
      \   }
      \ })

lua require('lspconfig').sumneko_lua.setup(
      \   require("lua-dev").setup({
      \     lspconfig = {
      \       cmd = { "lua-language-server" },
      \     }
      \   })
      \ )

" Note: Putting the setup calls into ftplugins saves 0.5ms per call during
" startup. At the moment it is not worth to write that many sudpid ftplugins.
