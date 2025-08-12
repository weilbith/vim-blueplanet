vim.keymap.set('n', '<leader>ws', '<cmd>split<CR>', { desc = 'split window into two horizontally' })
vim.keymap.set('n', '<leader>wv', '<cmd>vsplit<CR>', { desc = 'split window into two vertical' })

vim.keymap.set('n', '<leader>wc', '<cmd>close<CR>', { desc = 'close current window' })

vim.keymap.set(
  'n',
  '<leader>wh',
  '<cmd>wincmd h<CR>',
  { desc = 'move cursor to the next window on the left' }
)

vim.keymap.set(
  'n',
  '<leader>wj',
  '<cmd>wincmd j<CR>',
  { desc = 'move cursor to the next window below' }
)

vim.keymap.set(
  'n',
  '<leader>wk',
  '<cmd>wincmd k<CR>',
  { desc = 'move cursor to the next window above' }
)

vim.keymap.set(
  'n',
  '<leader>wl',
  '<cmd>wincmd l<CR>',
  { desc = 'move cursor to the next window to the right' }
)

vim.keymap.set('n', '<leader>wrl', '<C-w>>', { desc = 'increase window width' })
vim.keymap.set('n', '<leader>wrh', '<C-w><', { desc = 'decrease window width' })
vim.keymap.set('n', '<leader>wrk', '<C-w>+', { desc = 'increase window height' })
vim.keymap.set('n', '<leader>wrj', '<C-w>-', { desc = 'decrease window height' })

vim.keymap.set(
  'n',
  '<leader>wS',
  '<cmd>wincmd c | sbuffer<CR>',
  { desc = 'change to horizontal split layout of current window and adjacent one' }
)

vim.keymap.set(
  'n',
  '<leader>wV',
  '<cmd>wincmd c | vert sbuffer<CR>',
  { desc = 'change to vertical split layout of current window and adjacent one' }
)

local group = vim.api.nvim_create_augroup('Windows', {})
vim.api.nvim_create_autocmd('WinEnter', {
  group = group,
  command = 'set cursorline',
  desc = 'show cursor line highlight for active window',
})

vim.api.nvim_create_autocmd('WinLeave', {
  group = group,
  command = 'set nocursorline',
  desc = 'hide cursor line highlight for inactive windows',
})
