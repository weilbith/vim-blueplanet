for name, settings in pairs(require('lsp.symbols')) do
  if settings.is_symbol_kind then
    vim.api.nvim_set_hl(0, 'NavicIcons' .. name, { link = settings.highlight })
  end
end

vim.api.nvim_set_hl(0, 'NavbuddyNormalFloat', { link = 'LightPopupBackground' })
vim.api.nvim_set_hl(0, 'NavbuddyFloatBorder', { link = 'LightPopupBorder' })

vim.api.nvim_set_hl(0, 'NavbuddyNormalFloatMid', { link = 'DarkPopupBackground' })
vim.api.nvim_set_hl(0, 'NavbuddyFloatBorderMid', { link = 'DarkPopupBorder' })
