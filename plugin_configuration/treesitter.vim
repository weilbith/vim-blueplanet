highlight TSCurrentScope ctermbg=234

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript" },
  highlight = {
    enable = true,
  },
  refactor = {
    highlight_current_scope = {
      enable = true
    },
  },
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
  },
}

require'nvim-treesitter'.define_modules {
  set_folding = {
    enable = true,
    attach = function(bufnr, lang)
      vim.api.nvim_out_write("foo\n")
    end,
  }
}
EOF
