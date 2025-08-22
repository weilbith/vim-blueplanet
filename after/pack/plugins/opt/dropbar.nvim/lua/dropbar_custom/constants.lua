local icons = require('icons')

local symbols = vim.tbl_map(function(symbol_kind)
  return { icon = symbol_kind.icon, hl = symbol_kind.highlight }
end, icons.LSP.symbol_kind)

return {
  separator = icons.ChevronRight,
  symbols = symbols,
}
