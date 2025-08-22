local icons = require('icons')

local symbols = vim.tbl_map(function(symbol_kind)
  return { icon = symbol_kind.icon, hl = symbol_kind.highlight }
end, icons.LSP.symbol_kind)

require('symbols-outline').setup({
  width = 35,
  relative_width = false,
  autofold_depth = 1,
  fold_markers = { vim.opt.fillchars:get().foldclose, vim.opt.fillchars:get().foldopen },
  keymaps = {
    hover_symbol = '<C-k>',
  },
  -- TODO: Why can't I use a metatable with an __index here?
  symbols = symbols,
})
