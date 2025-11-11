vim.keymap.set('n', '<leader>ws', vim.cmd.split, { desc = 'split window into two horizontally' })
vim.keymap.set('n', '<leader>wv', vim.cmd.vsplit, { desc = 'split window into two vertical' })

vim.keymap.set('n', '<leader>wc', vim.cmd.close, { desc = 'close current window' })

vim.keymap.set('n', '<leader>wh', function()
  vim.cmd.wincmd('h')
end, { desc = 'move cursor to the next window on the left' })

vim.keymap.set('n', '<leader>wj', function()
  vim.cmd.wincmd('j')
end, { desc = 'move cursor to the next window below' })

vim.keymap.set('n', '<leader>wk', function()
  vim.cmd.wincmd('k')
end, { desc = 'move cursor to the next window above' })

vim.keymap.set('n', '<leader>wl', function()
  vim.cmd.wincmd('l')
end, { desc = 'move cursor to the next window to the right' })

vim.keymap.set('n', '<leader>wrl', function()
  vim.cmd.resize({ '+1', mods = { vertical = true } })
end, { desc = 'increase window width' })

vim.keymap.set('n', '<leader>wrh', function()
  vim.cmd.resize({ '-1', mods = { vertical = true } })
end, { desc = 'decrease window width' })

vim.keymap.set('n', '<leader>wrk', function()
  vim.cmd.resize('+1')
end, { desc = 'increase window height' })

vim.keymap.set('n', '<leader>wrj', function()
  vim.cmd.resize('-1')
end, { desc = 'decrease window height' })

vim.keymap.set('n', '<leader>wS', function()
  local current_buffer = vim.api.nvim_get_current_buf()
  vim.api.nvim_win_close(0, false)
  vim.api.nvim_open_win(current_buffer, true, { split = 'above' })
end, { desc = 'change to horizontal split layout of current window and adjacent one' })

vim.keymap.set('n', '<leader>wV', function()
  local current_buffer = vim.api.nvim_get_current_buf()
  vim.api.nvim_win_close(0, false)
  vim.api.nvim_open_win(current_buffer, true, { split = 'left' })
end, { desc = 'change to vertical split layout of current window and adjacent one' })

local group = vim.api.nvim_create_augroup('Windows', {})

vim.api.nvim_create_autocmd('WinEnter', {
  group = group,
  callback = function()
    vim.opt_local.cursorline = true
  end,
  desc = 'show cursor line highlight for active window',
})

vim.api.nvim_create_autocmd('WinLeave', {
  group = group,
  callback = function()
    vim.opt_local.cursorline = false
  end,
  desc = 'hide cursor line highlight for inactive windows',
})
