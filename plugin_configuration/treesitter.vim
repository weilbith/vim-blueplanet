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
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ip"] = "@parameter.inner",
        ["ap"] = "@parameter.outer",
      },
    },
    move = {
      enable = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]C"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[C"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["cxp"] = "@parameter.inner",
      },
      swap_previous = {
        ["cxP"] = "@parameter.inner",
      },
    },
  },
}
EOF
