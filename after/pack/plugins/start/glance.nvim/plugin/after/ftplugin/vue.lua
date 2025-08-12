vim.keymap.set(
  'n',
  '<leader>fr',
  '<cmd>Glance vue_file_references<CR>',
  { desc = 'peek references to Vue component defined in file', buffer = true }
)
