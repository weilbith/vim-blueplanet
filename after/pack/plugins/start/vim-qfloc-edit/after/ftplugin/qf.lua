vim.opt_local.winfixbuf = true

vim.cmd.packadd('vim-qfloc-edit')

vim.keymap.set(
  'n',
  'dd',
  '<cmd>RemoveEntryUnderCursorInCurrentListWindow<CR>',
  { desc = 'remove entry under cursor in current list window', buffer = true }
)

vim.keymap.set(
  'n',
  'u',
  '<cmd>UndoLastEntryRemovalInCurrentListWindow<CR>',
  { desc = 'undo last entry removal in current list window', buffer = true }
)
