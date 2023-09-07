for name, settings in pairs(require('lsp.symbols')) do
  vim.api.nvim_set_hl(0, 'DropBarKind' .. name, { link = settings.highlight })
  vim.api.nvim_set_hl(0, 'DropBarIconKind' .. name, { link = 'DropBarKind' .. name })
end

vim.api.nvim_set_hl(0, 'DropBarKindFolder', { link = 'LightGreyItalic' })
vim.api.nvim_set_hl(0, 'DropBarIconKindFolder', { link = 'DropBarKindFolder' })
vim.api.nvim_set_hl(0, 'DropBarIconUIIndicator', { link = 'LightGreyBold' })
vim.api.nvim_set_hl(0, 'DropBarPreview', { link = 'GreyBackground' })
vim.api.nvim_set_hl(0, 'DropBarHover', { link = 'GreyBackground' })
vim.api.nvim_set_hl(0, 'DropBarMenuHoverEntry', { link = 'GreyBackground' })
vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { link = 'ItalicBold' })
vim.api.nvim_set_hl(0, 'DropBarMenuNormalFloat', { link = 'DarkGreyBackgroundContrast' })
