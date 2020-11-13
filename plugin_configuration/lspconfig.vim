lua << EOF
local nvim_lsp = require'nvim_lsp'

nvim_lsp.pyls.setup{}
nvim_lsp.tsserver.setup{}
-- nvim_lsp.bashls.setup{filetypes = {"sh", "zsh"}}
nvim_lsp.cssls.setup{filetypes = {"css", "scss", "sass", "less"}}
nvim_lsp.dockerls.setup{}
nvim_lsp.html.setup{}
-- nvim_lsp.jsonls.setup{}
nvim_lsp.rust_analyzer.setup{}
nvim_lsp.terraformls.setup{}
nvim_lsp.texlab.setup{}
nvim_lsp.vimls.setup{}
nvim_lsp.vuels.setup{}
-- nvim_lsp.yamlls.setup{}
EOF
