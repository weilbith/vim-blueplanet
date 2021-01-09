lua require('lspconfig').bashls.setup({filetypes = {"sh", "zsh"}})
lua require('lspconfig').cssls.setup({ filetypes = { "css", "scss", "sass", "less" }})
lua require('lspconfig').dockerls.setup({})
lua require('lspconfig').html.setup({})
lua require('lspconfig').jsonls.setup({ cmd = { 'json-languageserver', '--stdio' }})
lua require('lspconfig').pyls.setup({})
lua require('lspconfig').rust_analyzer.setup({})
lua require('lspconfig').terraformls.setup({ cmd = { 'terraform-lsp', 'serve' }})
lua require('lspconfig').texlab.setup({})
lua require('lspconfig').tsserver.setup({})
lua require('lspconfig').vimls.setup({})
lua require('lspconfig').vuels.setup({})
lua require('lspconfig').yamlls.setup({})

" Note: Putting the setup calls into ftplugins saves 0.5ms per call during
" startup. At the moment it is not worth to write that many sudpid ftplugins.