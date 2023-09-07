local symbols = {}

for name, settings in pairs(require('lsp.symbols')) do
  if settings.is_symbol_kind then
    symbols[name] = { icon = settings.icon, hl = settings.highlight }
  end
end

return {
  separator = '',
  symbols = symbols,
}
