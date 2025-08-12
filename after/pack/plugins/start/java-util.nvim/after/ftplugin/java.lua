vim.cmd.packadd('java-util.nvim')

vim.keymap.set(
  'n',
  'grn',
  '<cmd>JavaUtil lsp_rename<CR>',
  { desc = 'Java specific renaming that also handles Lombok', buffer = true }
)

vim.keymap.set(
  'n',
  '<localleader>tr',
  '<cmd>JavaUtil lsp_goto_test<CR>',
  { desc = 'jump to related test', buffer = true }
)
