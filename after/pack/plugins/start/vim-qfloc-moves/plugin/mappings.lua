require('plugin_manager').load_package_on_command_s('vim-qfloc-moves', {
  'Copen',
  'Lopen',
  'Wincmd',
})

vim.keymap.set(
  'n',
  '<leader>qq',
  '<cmd>Copen<CR>',
  { desc = 'navigate to and from the quickfix window, opens it if closed' }
)

vim.keymap.set(
  'n',
  '<leader>ll',
  '<cmd>Lopen<CR>',
  { desc = 'navigate to and from the location list window, open it if closed' }
)

vim.keymap.set('n', '<leader>wh', '<cmd>Wincmd h<CR>', {
  desc = 'navigate to the next window towards the left, ingoring quickfix and location list windows',
})

vim.keymap.set(
  'n',
  '<leader>wj',
  '<cmd>Wincmd j<CR>',
  { desc = 'navigate to the next window downwards, ingoring quickfix and location list windows' }
)

vim.keymap.set(
  'n',
  '<leader>wk',
  '<cmd>Wincmd k<CR>',
  { desc = 'navigate to the next window upwards, ingoring quickfix and location list windows' }
)

vim.keymap.set('n', '<leader>wl', '<cmd>Wincmd l<CR>', {
  desc = 'navigate to the next window towards the right, ingoring quickfix and location list windows',
})
