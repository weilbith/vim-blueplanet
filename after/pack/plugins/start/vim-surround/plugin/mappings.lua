vim.keymap.set(
  'n',
  'ds',
  '<Plug>Dsurround',
  { desc = 'operation to delete text object surrounded by following pair descriptor' }
)

vim.keymap.set(
  'n',
  'cs',
  '<Plug>Csurround',
  { desc = 'operation to change text object surrounded by following pair descriptor' }
)

vim.keymap.set(
  'x',
  'S',
  '<Plug>VSurround',
  { desc = 'operation to change pair descriptor around text object' }
)
