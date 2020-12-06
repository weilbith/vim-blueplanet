lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "cpp",
    "css",
    "go",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "python",
    "query",
    "rst",
    "rust",
    "toml",
    "typescript",
    -- "vue",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
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

" TODO: only if parser gets attached (define-module not working)
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
