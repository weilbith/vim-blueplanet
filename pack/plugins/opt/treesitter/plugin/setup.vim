lua require('nvim-treesitter.configs').setup({
    \   ensure_installed = 'maintained',
    \   highlight = {
    \     enable = true,
    \   },
    \   indent = {
    \     enable = true
    \   },
    \ })

lua <<EOF
local define_modules = require('nvim-treesitter').define_modules
local query = require('nvim-treesitter.query')

local foldmethod_backups = {}
local foldexpr_backups = {}

define_modules({
  folding = {
    enable = true,
    attach = function(bufnr)
      -- Fold settings are actually window based...
      foldmethod_backups[bufnr] = vim.wo.foldmethod
      foldexpr_backups[bufnr] = vim.wo.foldexpr
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
    end,
    detach = function(bufnr)
      vim.wo.foldmethod = foldmethod_backups[bufnr]
      vim.wo.foldexpr = foldexpr_backups[bufnr]
      foldmethod_backups[bufnr] = nil
      foldexpr_backups[bufnr] = nil
    end,
    is_supported = query.has_folds
  }
})
EOF
