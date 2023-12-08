vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<cmd>DiffviewClose<CR>', {})

vim.defer_fn(function()
  vim.opt_local.statuscolumn = ''
end, 1)
