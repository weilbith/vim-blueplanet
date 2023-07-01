local icon_highlights = {}

for name, settings in pairs(require('lsp.symbols')) do
  if settings.is_symbol_kind then
    icon_highlights[name] = settings.highlight
  end
end

require('calltree').setup({
  icon_hls = icon_highlights,
})
