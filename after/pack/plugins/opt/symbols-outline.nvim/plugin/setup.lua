local symbols = {}

for name, settings in pairs(require('lsp.symbols')) do
  if settings.is_symbol_kind then
    symbols[name] = { icon = settings.icon, hl = settings.highlight }
  end
end

require('symbols-outline').setup({
  width = 35,
  relative_width = false,
  autofold_depth = 1,
  fold_markers = { '', '' },
  keymaps = {
    hover_symbol = '<C-k>',
  },
  -- TODO: Why can't I use a metatable with an __index here?
  symbols = symbols,
})
