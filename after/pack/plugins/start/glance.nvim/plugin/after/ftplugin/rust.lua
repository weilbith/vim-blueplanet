vim.keymap.set(
  'n',
  '<localleader>tr',
  '<cmd>Glance rust-analyzer_related-tests<CR>',
  { desc = 'peek usages in tests of target under cursor', buffer = true }
)
