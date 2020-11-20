highlight! link TSCurrentScope NormalInactive

lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_current_scope = { enable = false },
  },
}
EOF
