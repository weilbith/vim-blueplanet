vim.keymap.set('n', 'q', vim.cmd.DiffviewClose, { buffer = true })

vim.defer_fn(function()
  vim.opt_local.statuscolumn = ''
  vim.opt_local.winfixbuf = true
end, 1)
