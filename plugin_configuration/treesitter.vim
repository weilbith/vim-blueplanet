lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "javascript",
    "typescript",
    "python",
    "lua",
    "json",
    "html",
    "rust",
    "toml",
  },
  highlight = {
    enable = true,
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
