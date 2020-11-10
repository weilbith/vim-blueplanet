" Mappings to select and move text objects are defined as mapping externally

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["cxf"] = "@function.outer",
        ["cxp"] = "@parameter.inner",
      },
      swap_previous = {
        ["cxf"] = "@function.outer",
        ["cxp"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ["gK"] = "@function.outer",
      },
    },
  }
}
EOF
