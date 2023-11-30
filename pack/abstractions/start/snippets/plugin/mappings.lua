local snippet_navigation = require('snippets.navigation')

vim.keymap.set(
  { 'n', 'i', 's' },
  '<C-s>',
  snippet_navigation.jump_forward,
  { desc = 'jump to next tabstop within active snippet' }
)

vim.keymap.set(
  { 'n', 'i', 's' },
  '<C-b>',
  snippet_navigation.jump_backward,
  { desc = 'jump to previous tabstop within active snippet' }
)
