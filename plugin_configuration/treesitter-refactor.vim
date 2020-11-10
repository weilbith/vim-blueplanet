highlight TSCurrentScope ctermbg=234

lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_current_scope = { enable = true },
  },
}
EOF
