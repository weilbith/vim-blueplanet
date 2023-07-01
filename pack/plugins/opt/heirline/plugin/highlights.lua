for name, settings in pairs(require('lsp.symbols')) do
  vim.api.nvim_set_hl(0, 'DropBarKind' .. name, { link = settings.highlight })
  vim.api.nvim_set_hl(0, 'DropBarIconKind' .. name, { link = 'DropBarKind' .. name })
end

vim.api.nvim_set_hl(0, 'DropBarKindFolder', { link = 'WhiteItalic' })
vim.api.nvim_set_hl(0, 'DropBarIconKindFolder', { link = 'DropBarKindFolder' })
