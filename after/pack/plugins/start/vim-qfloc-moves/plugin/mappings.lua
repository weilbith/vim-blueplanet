require('plugin_manager').lazy_load_plugin_on_command('vim-qfloc-moves', {
  'Copen',
  'Lopen',
  'Wincmd',
})

vim.keymap.set(
  'n',
  '<leader>qq',
  vim.cmd.Copen,
  { desc = 'navigate to and from the quickfix window, opens it if closed' }
)

vim.keymap.set(
  'n',
  '<leader>ll',
  vim.cmd.Lopen,
  { desc = 'navigate to and from the location list window, open it if closed' }
)

vim.keymap.set('n', '<leader>wh', function()
  vim.cmd.Wincmd('h')
end, {
  desc = 'navigate to the next window towards the left, ingoring quickfix and location list windows',
})

vim.keymap.set('n', '<leader>wj', function()
  vim.cmd.Wincmd('j')
end, {
  desc = 'navigate to the next window downwards, ingoring quickfix and location list windows',
})

vim.keymap.set('n', '<leader>wk', function()
  vim.cmd.Wincmd('k')
end, { desc = 'navigate to the next window upwards, ingoring quickfix and location list windows' })

vim.keymap.set('n', '<leader>wl', function()
  vim.cmd.Wincmd('l')
end, {
  desc = 'navigate to the next window towards the right, ingoring quickfix and location list windows',
})
