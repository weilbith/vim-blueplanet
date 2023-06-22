for name, settings in pairs(require('lsp.symbols')) do
  if settings.is_completion_kind then
    vim.api.nvim_set_hl(0, 'DropBarKind' .. name, { link = settings.highlight })
    vim.api.nvim_set_hl(0, 'DropBarIconKind' .. name, { link = 'DropBarKind' .. name })
  end
end

vim.api.nvim_set_hl(0, 'DropBarKindFolder', { link = 'WhiteItalic' })
vim.api.nvim_set_hl(0, 'DropBarIconKindFolder', { link = 'DropBarKindFolder' })
