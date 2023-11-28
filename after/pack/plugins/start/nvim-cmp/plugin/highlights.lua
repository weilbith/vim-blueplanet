vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { link = 'Blue' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'BlueItalic' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { foreground = '#808080', strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemKind', { link = 'LightGrey' })

for name, settings in pairs(require('lsp.symbols')) do
  if settings.is_completion_kind then
    vim.api.nvim_set_hl(0, 'CmpItemKind' .. name, { link = settings.highlight })
  end
end
