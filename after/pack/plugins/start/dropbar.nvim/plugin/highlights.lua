local icons = require('icons')

for name, settings in pairs(icons.LSP.symbol_kind) do
  vim.api.nvim_set_hl(0, 'DropBarKind' .. name, { link = settings.highlight, force = true })
  vim.api.nvim_set_hl(0, 'DropBarIconKind' .. name, { link = 'DropBarKind' .. name, force = true })
end

for name, settings in pairs(icons.LSP.completion_item_kind) do
  vim.api.nvim_set_hl(0, 'DropBarKind' .. name, { link = settings.highlight, force = true })
  vim.api.nvim_set_hl(0, 'DropBarIconKind' .. name, { link = 'DropBarKind' .. name, force = true })
end

vim.api.nvim_set_hl(0, 'DropBarKindFolder', { link = 'LightGreyItalic', force = true })
vim.api.nvim_set_hl(0, 'DropBarIconKindFolder', { link = 'DropBarKindFolder', force = true })
vim.api.nvim_set_hl(0, 'DropBarIconUIIndicator', { link = 'LightGreyBold', force = true })
vim.api.nvim_set_hl(0, 'DropBarPreview', { link = 'GreyBackground', force = true })
vim.api.nvim_set_hl(0, 'DropBarMenuHoverEntry', { link = 'PmenuSel', force = true })
vim.api.nvim_set_hl(0, 'DropBarHover', { link = 'GreyBackground' })
vim.api.nvim_set_hl(0, 'DropBarMenuCurrentContext', { link = 'DarkGreyBackground', force = true })
vim.api.nvim_set_hl(0, 'DropBarMenuNormalFloat', { link = 'Pmenu', force = true })
