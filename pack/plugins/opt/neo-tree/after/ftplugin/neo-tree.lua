vim.defer_fn(function()
  vim.opt_local.statuscolumn = nil

  vim.keymap.del('n', 'z', { buffer = 0 })
  vim.keymap.set('n', 'l', '<CR>', { buffer = 0, remap = true })
  vim.keymap.set('n', 'h', 'C', { buffer = 0, remap = true })
  vim.keymap.set('n', 'h', 'C', { buffer = 0, remap = true })
end, 1)
