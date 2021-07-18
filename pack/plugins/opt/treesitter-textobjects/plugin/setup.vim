lua require('nvim-treesitter.configs').setup({
    \   textobjects = {
    \     lsp_interop = {
    \       enable = true,
    \     },
    \     select = {
    \       enable = true,
    \       lookahead = true,
    \     },
    \   },
    \ })
