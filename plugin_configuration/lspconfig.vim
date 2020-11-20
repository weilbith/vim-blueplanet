lua << EOF
local lspconfig = require'lspconfig'

-- lspconfig.bashls.setup{filetypes = {"sh", "zsh"}}
lspconfig.cssls.setup{filetypes = {"css", "scss", "sass", "less"}}
lspconfig.dockerls.setup{}
lspconfig.html.setup{}
-- lspconfig.jsonls.setup{}
lspconfig.pyls.setup{}
lspconfig.rust_analyzer.setup{}
-- lspconfig.terraformls.setup{}
-- lspconfig.texlab.setup{}
lspconfig.tsserver.setup{}
lspconfig.vimls.setup{}
lspconfig.vuels.setup{}
-- lspconfig.yamlls.setup{}
EOF
