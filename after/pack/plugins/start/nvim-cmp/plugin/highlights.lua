vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { link = 'Bold' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'ItalicBold' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { foreground = '#808080', strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemKind', { link = 'LightGrey' })

for name, symbol_kind in pairs(require('icons').LSP.completion_item_kind) do
  vim.api.nvim_set_hl(0, 'CmpItemKind' .. name, { link = symbol_kind.highlight })
end
